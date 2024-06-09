module Reg_File (A1,A2,A3,WD3,WE3,clk,rst,RD1,RD2);
    //NOTES:
    // WD3 = Write Data 
    // WE3 = Write Enable (Comming From Control Unit's RegWrite Output)

    //Declaring Inputs:
    input [2:0] A1,A2,A3;
    input [15:0] WD3;
    input clk,rst,WE3;
    
    //Declaring Outputs:
    output [15:0] RD1,RD2;

    //Creation Of The Memory:
    reg[15:0] Registers [15:0];

    //Read Functionality:
    assign RD1 = (!rst) ? 16'b0000000000000000 : Registers[A1];
    assign RD2 = (!rst) ? 16'b0000000000000000 : Registers[A2];

    //Write Functionality:
    always @(posedge clk) begin// Positive Edge Of The Clock
        if (WE3)
            begin
                Registers[A3] <= WD3;
            end
    end


    //We can Initialize Data Of Registers From Here!
    initial begin
        Registers[0] = 16'b0000000000000000;// $zero
        Registers[1] = 16'b0000000000000001;
        Registers[2] = 16'b0000000000000010;
        Registers[3] = 16'b0000000000000011;
        // Registers[4] = 16'b0000000000000100;
        Registers[5] = 16'b0000000000000101;
        Registers[6] = 16'b0000000000000110;
    end

endmodule