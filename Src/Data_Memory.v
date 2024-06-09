module Data_Mem (A,WD,WE,RE,clk,RD,rst);
    //Declaring Inputs:
    input [15:0] A,WD;
    input clk,WE,RE,rst;

    //Declaruing Outputs:
    output [15:0] RD;


    //Creation OF Memory:
    reg[15:0] Data_MEM [255:0];



    //Read Functionality:
    assign RD = ((WE == 1'b0) & (WD == 1'b1) & (RE) & (rst)) ? Data_MEM[A] : 16'b0;
    
    //Write Functionality:
    always @(posedge clk) begin
        if(WE)
            begin
                Data_MEM[A] <= WD;
            end
    end

    //We can Initialize Data Of The Memory From Here!
    initial begin
        Data_MEM[0] = 16'b0000000000000000;
        Data_MEM[1] = 16'b0000000000000001;
        Data_MEM[2] = 16'b0000000000000010;
    end

endmodule
