`include "/home/baymax/Air-Uni-EE/Verilog/Single_Cycle_Top.v"
module Single_Cycle_Top_tb ();
    reg clk=1'b1,rst;

    Single_Cycle_Top Single_Cycle_Top (
        .clk(clk),
        .rst(rst)
    );
    always  
        begin
            clk = ~clk;
            #100;
        end
    initial begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #450;
        $finish;
    end
    initial begin
        $dumpfile("Single_Cycle.vcd");
        $dumpvars(0);
    end
endmodule