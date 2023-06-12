module Mux (In1,In2,Selection,Out);
    //Declaring Inputs:
    input [15:0] In1,In2;
    input Selection;
    
    //Declaring Output:
    output [15:0] Out;

    //Assigning Output:
    assign Out = (~Selection) ? In1 : In2;
endmodule