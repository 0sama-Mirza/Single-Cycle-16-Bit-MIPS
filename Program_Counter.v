module PC(PC_NEXT,pc,rst,clk);
    //Declaring Inputs:
    input [15:0] PC_NEXT;
    input clk,rst;

    //Declaring Outputs:
    output reg [15:0] pc;
    always @(posedge clk) begin //On every Positive Edge of the clock do:
        if (rst == 1'b0)// Active Low Values.
            begin
                pc <= 16'b0000000000000000;
            end
        else
            begin
                pc <= PC_NEXT;
            end
    end
endmodule
