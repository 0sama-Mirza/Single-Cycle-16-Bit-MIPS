module control_unit (op,RegWrite,MemWrite,ALUSrc,ALUOp,RegDst,MemToReg,MemRead,Jump_EN);

    //Inputs / Outputs declaration
    input [2:0] op;
    output RegWrite,MemWrite,ALUSrc,RegDst,MemToReg,MemRead,Jump_EN;
    output [1:0] ALUOp;
    

    //Assigning Outputs:
    // NOTES:
    // ________________________________________________________________________________________________
    // |Instruction | OP  | RegDst | ALUSrc | MemToReg | RegWrite | MemRead | MemWrite | ALUOp | Jump |
    // |  R-Type    | 000 |    1   |    0   |     0    |     1    |    0    |    0     |   00  |  0   |
    // | Load Word  | 001 |    0   |    1   |     1    |     1    |    1    |    0     |   11  |  0   |
    // |Store Word  | 010 |    0   |    1   |     0    |     0    |    0    |    1     |   11  |  0   |
    // |Jump-Type   | 011 |    0   |    0   |     0    |     0    |    0    |    0     |   00  |  1   |
    // |   addi     | 100 |    0   |    1   |     0    |     1    |    0    |    0     |   11  |  0   |
    // ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
    assign RegWrite = ((op == 3'b000) | (op == 3'b001) | (op == 3'b100)) ? 1'b1 : 1'b0;// if (op == R-type | op == lw | op == addi)

    assign RegDst = (op == 3'b000) ? 1'b1 : 1'b0;// if (op == R-type)

    assign ALUSrc = ((op == 3'b001) | (op == 3'b010) | (op == 3'b100)) ? 1'b1 : 1'b0;// if (op == lw | op == lw | op == addi)

    assign MemToReg = (op == 3'b001) ? 1'b1 : 1'b0;// if (op == lw)

    assign MemRead = ((op == 3'b001) | (op == 3'b010)) ? 1'b1 : 1'b0;// if (op == lw | op == sw)

    assign MemWrite = (op == 3'b010) ? 1'b1 : 1'b0;// if (op == sw)

    assign ALUOp = ((op == 3'b001) | (op == 3'b010) | (op == 3'b100)) ? 2'b11 : 2'b00;// if (op == lw | op == sw | op == addi)

    assign Jump_EN = (op == 3'b011) ? 1'b1 : 1'b0; // if (op == jump)

endmodule
