module alu_control (alu_op,ALUControl,Fun);
    //Declaring Inputs:
    input [1:0] alu_op;
    input [3:0] Fun;

    //Declaring Outputs:
    output [2:0] ALUControl;

    //Intermediate Wire
    wire [5:0] ALUControlIn;
    assign ALUControlIn = {alu_op,Fun}; //Contatinate. Same Pattern {Fun,alu_op}!={alu_op,Fun};

    //Tenary Operator
    assign ALUControl = (ALUControlIn == 6'b11xxxx) ? 3'b000: // lw,sw I-type
                        (ALUControlIn == 6'b000000) ? 3'b000: // Add R-type
                        (ALUControlIn == 6'b000001) ? 3'b001: // Sub R-type
                        (ALUControlIn == 6'b000010) ? 3'b010: // AND R-type
                        (ALUControlIn == 6'b000011) ? 3'b011: // Or R-type
                        3'b000;
endmodule
