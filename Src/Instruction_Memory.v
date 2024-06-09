module Instr_Mem (A,RD,rst);
input rst;
input [15:0]A;
output [15:0]RD;

reg [15:0] mem [1023:0];

assign RD = (~rst) ? {16{1'b0}} : mem[A[15:2]];


initial begin

  mem[0] = 16'b0000100100000100; // addi $4,$Zero,04
  //           Fun  RD RT RS OP  // RD = RS (Operator) RT
  mem[1] = 16'b0000101100110000; // add $5,$6,$4
  // mem[0] = 16'b0000001011010000; // add $1,$2,$3
  mem[2] = 16'b0001001011010000; // sub $1,$2,$3
  mem[3] = 16'b0010001011010000; // and $1,$2,$3
  mem[4] = 16'b0011001011010000; // or $1,$2,$3
  mem[5] = 16'b0000101100110000; // add $5,$6,$4
  mem[6] = 16'b0000000101000010; // sw $5,M[0]
  mem[7] = 16'b0000000000000011; // Jump 0
end

endmodule
