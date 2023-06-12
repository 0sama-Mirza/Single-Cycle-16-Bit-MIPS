module alu (A,B,ALUControl,Result,Negative,Carry,Zero);
    //declaring inputs
    input [15:0] A,B;
    input [2:0] ALUControl;

    //declaring Outputs
    output [15:0] Result;
    //Flags
    output Negative,Carry,Zero;

    //declaring intermediate wires
    //AND or OR:
    wire [15:0] a_and_b;
    wire [15:0] a_or_b;

    //Addition or Subtraction:
    wire [15:0] not_b;
    wire [15:0] sum; 
    wire cout;
    //Mux
    wire [15:0] mux_1; //2's Complement Or Not
    wire [15:0] mux_2;

    //logic Design Outputs
    //AND Operation
    assign a_and_b = A & B;

    //OR Operation (Additional)
    assign a_or_b = A | B;

    //Tenary Operator
    //assign name = (Condition) ? True Value : False Value; 
    assign mux_1 = (ALUControl[0] == 2'b0) ? B : not_b; //2's complement

    //Addition or Subtraction:
    assign not_b = ~B; // 2's complement of B
    assign {cout,sum} = A + mux_1 + ALUControl[0];

    //4X1 Mux:
    assign mux_2 = (ALUControl[1:0] == 2'b00) ? sum : 
                   (ALUControl[1:0] == 2'b01) ? sum : 
                   (ALUControl[1:0] == 2'b10) ? a_and_b : a_or_b;

    // assign mux_2 = (ALUControl[1] == 1'b0) ? sum :
    //                (ALUControl[0] == 1'b0) ? a_and_b : a_or_b;
                   
    //Result:
    assign Result = mux_2;

    //Flag Assignments:
    assign Zero = &(~Result); //Zero Flag
    assign Negative = Result[15]; //Negative Flag
    assign Carry = cout & (~ALUControl[1]); //Carry Flag

endmodule
