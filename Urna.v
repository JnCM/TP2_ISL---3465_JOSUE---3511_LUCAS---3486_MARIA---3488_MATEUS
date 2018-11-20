module Urna(Valid, Digit, Finish, Clock, C1, C2, C3, C4, Nulo, VoteStatus);
  input wire [3:0]Digit;
  input wire Valid, Finish, Clock;
  output reg VoteStatus;
  output reg [7:0]C1;
  output reg [7:0]C2;
  output reg [7:0]C3;
  output reg [7:0]C4;
  output reg [7:0]Nulo;
  always @(posedge Clock) begin
      if(Finish) begin
          C1 <= 8'b00000000;
          C2 <= 8'b00000000;
          C3 <= 8'b00000000;
          C4 <= 8'b00000000;
          Nulo <= 8'b00000000;
      end
      if(~Finish) begin
        if((Digit[3]==0)&(Digit[2]==0)&(Digit[1]==0)&(Digit[0]==1)&(Valid)) begin
            VoteStatus <= 1;
            C1 <= C1 + 8'b00000001;
        end
        else if((Digit[3]==0)&(Digit[2]==1)&(Digit[1]==0)&(Digit[0]==1)&(Valid)) begin
            VoteStatus <= 1;
            C2 <= C2 + 8'b00000001;
        end
        else if((Digit[3]==0)&(Digit[2]==1)&(Digit[1]==1)&(Digit[0]==0)&(Valid)) begin
            VoteStatus <= 1;
            C3 <= C3 + 8'b00000001;
        end
        else if((Digit[3]==1)&(Digit[2]==0)&(Digit[1]==0)&(Digit[0]==0)&(Valid)) begin
            VoteStatus <= 1;
            C4 <= C4 + 8'b00000001;
        end
        else begin
            VoteStatus <= 0;
            Nulo <= Nulo + 8'b00000001;
        end
      end
  end
endmodule
