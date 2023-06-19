`include "/home/baymax/Air-Uni-EE/Verilog/Program_Counter.v"
`include "/home/baymax/Air-Uni-EE/Verilog/Instruction_Memory.v"
`include "/home/baymax/Air-Uni-EE/Verilog/Register_File.v"
`include "/home/baymax/Air-Uni-EE/Verilog/Sign_Extender.v"
`include "/home/baymax/Air-Uni-EE/Verilog/ALU.v"
`include "/home/baymax/Air-Uni-EE/Verilog/Control_Unit.v"
`include "/home/baymax/Air-Uni-EE/Verilog/ALU_Control.v"
`include "/home/baymax/Air-Uni-EE/Verilog/Data_Memory.v"
`include "/home/baymax/Air-Uni-EE/Verilog/PC_Adder.v"
`include "/home/baymax/Air-Uni-EE/Verilog/Mux.v"
module Single_Cycle_Top (alu_Carry_Out,alu_Negative_Out,alu_Zero_Out,random,clk,rst,clk_out,rst_out,Reg_Write_Out,MemWrite_Out,ALUSrc_Out,RegDst_Out,MemToReg_Out,MemRead_Out,ALUOp_Out);
    //Declaring Inputs:
    input rst,clk;

    wire[15:0] PC_Top,RD_Instr,RD1_Top,RD2_Top,SignExt_Top,ALU_RESULT;// For Connecting RD (From Instruction Memory) To Register File
    //Control Unit's Wires:
    wire RegWrite,MemWrite,ALUSrc,RegDst,MemToReg,MemRead;
    wire [1:0] ALUOp;
    //ALU_Control's Wires:
    wire [2:0] ALUControl_Top;
    //DataMemory:
    wire [15:0] ReadData;
    //PC's Wires:
    wire [15:0] NEW_PC;
    //Mux_Register_To_ALU Result:
    wire [15:0] Mux_Register_To_ALU_Result;
    wire [15:0] Mux_Data_Memory_To_Register_File_Write_Back_Result;

    //Declaring Outputs:
    output clk_out,rst_out,Reg_Write_Out,MemWrite_Out,ALUSrc_Out,RegDst_Out,MemToReg_Out,MemRead_Out,alu_Negative_Out,alu_Zero_Out,alu_Carry_Out;
    output [1:0] ALUOp_Out;
    output [2:0] random;
    //Assigning The Outputs:
    assign clk_out = clk;
    assign rst_out = rst;
    assign Reg_Write_Out = Reg_Write_Out;
    assign MemWrite_Out = MemWrite;
    assign ALUSrc_Out = ALUSrc;
    assign RegDst_Out = RegDst;
    assign MemToReg_Out = MemToReg;
    assign MemRead_Out = MemRead;
    assign ALUOp_Out = ALUOp;
    assign random = RD_Instr[8:6];
	 
    //assign alu_Zero_Out = ;
    //assign alu_Negative_Out = ;
    //assign alu_Carry_Out = ;
	 
    PC PC(
        .clk(clk),
        .rst(rst),
        .pc(PC_Top), 
        .PC_NEXT(NEW_PC)
    );


    PC_Adder PC_Adder(
        .OLD_PC(PC_Top),
        .NEW_PC(NEW_PC),
        .Four16Bit(16'b0000000000000100)
    );


    Instr_Mem Instruction_Memory(
        .rst(rst),
        .A(PC_Top),
        .RD(RD_Instr)
    );


    control_unit Control_Unit(
        .op(RD_Instr[2:0]),
        .RegWrite(RegWrite),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp),
        .RegDst(RegDst),
        .MemToReg(MemToReg),
        .MemRead(MemRead)
    );

    alu_control ALU_Control (
        .alu_op(ALUOp),
        .ALUControl(ALUControl_Top),
        .Fun(RD_Instr[15:12])
    );    




    Reg_File Register_File(
        .A1(RD_Instr[5:3]),
        .A2(RD_Instr[8:6]),
        .A3(RD_Instr[11:9]),
        .WD3(Mux_Data_Memory_To_Register_File_Write_Back_Result),
        .WE3(RegWrite),
        .clk(clk),
        .rst(rst),
        .RD1(RD1_Top),
        .RD2(RD2_Top)
    );

    

    Sign_Extend Sign_Extend(
        .In_Str(RD_Instr),
        .Extended_Out(SignExt_Top)
    );

    Mux Mux_Register_To_ALU(
        .In1(RD2_Top),
        .In2(SignExt_Top),
        .Selection(ALUSrc),
        .Out(Mux_Register_To_ALU_Result)
    ); 

    alu ALU(
        .A(RD1_Top),
        .B(Mux_Register_To_ALU_Result),
        .ALUControl(ALUControl_Top),
        .Result(ALU_RESULT),
        .Negative(alu_Negative_Out),
        .Carry(alu_Carry_Out),
        .Zero(alu_Zero_Out)
    );

    Data_Mem Data_Memory (
        .A(ALU_RESULT),
        .WD(RD2_Top),
        .WE(MemWrite),
        .RE(MemRead),
        .clk(clk),
        .RD(ReadData),
        .rst(rst)
    );

    Mux Mux_Data_Memory_To_Register_File_Write_Back(
        .In1(ALU_RESULT),
        .In2(ReadData),
        .Selection(MemToReg),
        .Out(Mux_Data_Memory_To_Register_File_Write_Back_Result)
    ); 
endmodule
