# Single-Cycle-16-Bit-MIPS
Complex Engineering Problem (CEP) By:


Osama Anees, Rayyan Munir and Muneeb Khan.


Only Does R-Type Instruction of add,sub,and,or And I-Type Instruction of lw,sw
# How to compile it?
## Download 
+ Icarus Verilog: https://github.com/steveicarus/iverilog
+ VS-Code: https://code.visualstudio.com/
+ Xilinx ISE: https://www.xilinx.com/products/design-tools/ise-design-suite/ise-webpack.html
+ GTKWave: https://gtkwave.sourceforge.net/
## Compile
1. Open the Single_Cycle_Top_tb.v file. Make sure to edit your "includes" file path in the test bench and Single_Cycle_Top.v file.
2. Go to terminal and type: 
  + iverilog Single_Cycle_Top_tb.v
    + This will generate an "a.out" file.
  + vvp a.out
    + This will convert the .out file into vcd file which gtkwave can read.
  + gtkwave Single_Cycle.vcd
    + GTKWave will open the wave file.
    + To make groups press "Ctrl+B" to create a blank block. Then press "G" to create a group. Just insert things in it.
# Please see [4th_Semester_COAL_CEP.pdf](https://github.com/0sama-Mirza/Single-Cycle-16-Bit-MIPS/blob/main/4th_Semester_COAL_CEP.pdf) for further information.
# Special Thanks To MERL_DSU Who Created The Youtube Playlist For Single_Cycle_RISC_Core:
## Their Github: https://github.com/merldsu
## The Playlist: https://www.youtube.com/watch?v=BVvDHhG0RoA&list=PL5AmAh9QoSK7Fwk9vOJu-3VqBng_HjGFc
