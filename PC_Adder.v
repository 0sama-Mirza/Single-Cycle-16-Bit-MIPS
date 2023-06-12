module PC_Adder (OLD_PC,NEW_PC,Four16Bit);

    //Declaring Inputs:
    input [15:0]OLD_PC,Four16Bit;

    //Declaring Outputs:
    output [15:0] NEW_PC;

    //Assigning Outputs:
    assign NEW_PC = OLD_PC + Four16Bit;
    
endmodule