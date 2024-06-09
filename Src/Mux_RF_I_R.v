module Mux_RF_I_R (In1,In2,Sel,Address_Out);
    input [2:0] In1,In2;
    input Sel;
    output [2:0] Address_Out;
    assign Address_Out = (~Sel) ? In1 : In2;
endmodule