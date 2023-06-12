module Instr_Mem (A,RD,rst);
input rst;
input [15:0]A;
output [15:0]RD;

reg [15:0] mem [1023:0];

assign RD = (~rst) ? {16{1'b0}} : mem[A[15:2]];


initial begin
  mem[0] = 16'b0000011010001000; // add $1,$2,$3
  mem[1] = 16'b0001011010001000; // sub $1,$2,$3
  mem[2] = 16'b0010011010001000; // and $1,$2,$3
  //  mem[3] = 16'b0001011010001000;
  // mem[4] = 16'b0000011010001000;
  //  mem[5] = 16'b0001011010001000;

end

endmodule
