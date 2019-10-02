// Controller for the Booth's Multiplier

module controller(
    ldA,
    clrA,
    sftA,
    ldQ,
    clrQ,
    sftQ,
    clrff,
    ldM,
    addsub,
    ldcount,
    decount,
    done,
    clk,
    q0,
    qd,
    stop,
    start
);

input clk, q0, qd, stop, start;
output reg ldA,clrA,sftA,ldQ,clrQ,sftQ;
output reg ldM,clrff,addsub,ldcount,decount, done;

reg [2:0] state;

parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011,
          S4=3'b100, S5=3'b101, S6=3'b110;

always @(posedge clk)
begin
    case(state)
      S0:    if (start) state <= S1;
      S1:    state <= S2;
      S2:    if({q0,qd}==2'b01) state <= S3;
             else if ({q0,qd}==2'b10) state <= S4;
             else state <= S5;
      S3:    state <= S5;
      S4:    state <= S5;
      S5:    if(({q0,qd}==2'b01) && (stop==0)) state <= S3;
             else if(({q0,qd}==2'b10) && (stop==0)) state <= S4;
             else if(stop!=0) state <= S6;
      S6:    state <= S6;
      default:    state <= S0;
    endcase
end

always @(state)
begin
    case(state)
      S0: begin
          ldA=0; clrA=0; sftA=0; ldQ=0; clrQ=0; sftQ=0;
          ldM=0; clrff=0; done=0;    
      end
      S1: begin
          clrA=1; clrff=1; ldcount=1; ldM=1;
      end
      S2: begin
          clrA=0; clrff=0; ldcount=0; ldM=0; ldQ=1;
      end
      S3: begin
          ldA=1; addsub=1; ldQ=0; sftA=0; sftQ=0; decount=0;
      end
      S4: begin
          ldA=1; addsub=0; ldQ=0; sftA=0; sftQ=0; decount=0;
      end
      S5: begin
          ldA=0; ldQ=0; sftA=1; sftQ=1; decount=1;
      end
      S6: begin
          done=1;
      end
      default: begin
          clrA=0; sftA=0; ldQ=0; sftQ=0;
      end
    endcase
end

endmodule