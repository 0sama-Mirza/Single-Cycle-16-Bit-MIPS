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


# [Documentation for: project_icarus](https://0sama-mirza.github.io/Single-Cycle-16-Bit-MIPS/Doc/index.html)

Generated by **TerosHDL** © 2020-2021 License GPLv3<br>Carlos Alberto Ruiz Naranjo (carlosruiznaranjo@gmail.com)<br>Ismael Perez Rojo (ismaelprojo@gmail.com)<br><br>Project revision 2023-06-20 01:25:05<br><br>
![system](Doc/doc_internal/dependency_graph.svg "System")
## Designs

- Module: [Sign_Extend ](Doc/doc_internal/Sign_Extender.md)
- Module: [Reg_File ](Doc/doc_internal/Register_File.md)
- Module: [PC ](Doc/doc_internal/Program_Counter.md)
- Module: [PC_Adder ](Doc/doc_internal/PC_Adder.md)
- Module: [Mux ](Doc/doc_internal/Mux.md)
- Module: [Instr_Mem ](Doc/doc_internal/Instruction_Memory.md)
- Module: [Data_Mem ](Doc/doc_internal/Data_Memory.md)
- Module: [control_unit ](Doc/doc_internal/Control_Unit.md)
- Module: [alu_control ](Doc/doc_internal/ALU_Control.md)
- Module: [alu ](Doc/doc_internal/ALU.md)
- Module: [Single_Cycle_Top ](Doc/doc_internal/Single_Cycle_Top.md)



# Please see [4th_Semester_COAL_CEP.pdf](https://github.com/0sama-Mirza/Single-Cycle-16-Bit-MIPS/blob/main/Doc/4th_Semester_COAL_CEP.pdf) for further information.
# Special Thanks To MERL_DSU Who Created The Youtube Playlist For Single_Cycle_RISC_Core:
## Their Github: https://github.com/merldsu
## The Playlist: https://www.youtube.com/watch?v=BVvDHhG0RoA&list=PL5AmAh9QoSK7Fwk9vOJu-3VqBng_HjGFc

