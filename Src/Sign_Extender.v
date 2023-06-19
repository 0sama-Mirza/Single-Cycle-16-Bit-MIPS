module Sign_Extend (In_Str,Extended_Out);
    //Declaring Inputs:
    input [15:0] In_Str;

    //Declaring Outputs:
    output [15:0] Extended_Out;

    //Assigning Outputs:
    assign Extended_Out = (In_Str[9]) ? {{9{1'b1}},In_Str[15:9]}:
                                        {{9{1'b0}},In_Str[15:9]};
endmodule