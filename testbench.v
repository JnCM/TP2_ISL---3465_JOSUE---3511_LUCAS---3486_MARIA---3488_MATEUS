`include "Urna.v"
module testbench();
  reg [3:0]Digit;
  reg Valid, Finish, Clock;
  wire VoteStatus;
  wire [7:0]C1;
  wire [7:0]C2;
  wire [7:0]C3;
  wire [7:0]C4;
  wire [7:0]Nulo;
  Urna moduloUrna(.Valid(Valid), .Digit(Digit), .Finish(Finish), .Clock(Clock), .C1(C1), .C2(C2), .C3(C3), .C4(C4), .Nulo(Nulo), .VoteStatus(VoteStatus));
  initial begin
    $dumpfile("Urna.vcd");
    $dumpvars(0, testbench);
    $display("Exibindo a eleicao:");
    $monitor("C1: %b\nC2: %b\nC3: %b\nC4: %b\nNulo: %b\n", C1, C2, C3, C4, Nulo);
  end
  initial begin
    #1; Clock = 0;
    #1; Clock = 1; Finish = 1;
    #1; Clock = 0;
    #1; Clock = 1; Finish = 0; Digit = 4'b0001; Valid = 1;
    #1; Clock = 0;
    #1; Clock = 1; Finish = 0; Digit = 4'b0101; Valid = 1;
    #1; Clock = 0;
    #1; Clock = 1; Finish = 0; Digit = 4'b0110; Valid = 1;
    #1; Clock = 0;
    #1; Clock = 1; Finish = 0; Digit = 4'b1000; Valid = 1;
    #1; Clock = 0;
    #1; Clock = 1; Finish = 0; Digit = 4'b1010; Valid = 1;
    #1; Clock = 0;
    #1; Clock = 1; Finish = 1;
    #1;
  end
endmodule
