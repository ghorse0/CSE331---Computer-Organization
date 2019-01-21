module alu32 (R ,S, A , B ,zerocontrol,overflow,carry_out);

output zerocontrol,carry_out,overflow;

wire zeroNotWire,overflowSub,overflowAdd;
				 			 
input [31:0] A,B;
input [2:0] S ;

wire [31:0] and_R,or_R,xor_R,
				rightAr_R,leftLo_R,nor_R;
				 
wire [32:0] sub_R,add_R;				 
wire [31:0] R0,R1;

output [31:0] R;
  
and_A_B andOperation (and_R,A,B);
or_A_B orOperation (or_R,A,B);
add_A_B addOperation (add_R,A,B,overflowAdd);
xor_A_B xorOperation (xor_R,A,B);
sub_A_B subOperation (sub_R,A,B,overflowSub);
rightAr_A_B rightAriOperation(rightAr_R,A,B);
leftLo_A_B leftLoOperation(leftLo_R,A,B);
nor_A_B norOperation(nor_R,A,B);


four_to_one_mux  OPCODE0(R0[0],and_R[0],or_R[0],add_R[0],xor_R[0],S[0],S[1]); 
four_to_one_mux  OPCODE1(R0[1],and_R[1],or_R[1],add_R[1],xor_R[1],S[0],S[1]);
four_to_one_mux  OPCODE2(R0[2],and_R[2],or_R[2],add_R[2],xor_R[2],S[0],S[1]);
four_to_one_mux  OPCODE3(R0[3],and_R[3],or_R[3],add_R[3],xor_R[3],S[0],S[1]);
four_to_one_mux  OPCODE4(R0[4],and_R[4],or_R[4],add_R[4],xor_R[4],S[0],S[1]);
four_to_one_mux  OPCODE5(R0[5],and_R[5],or_R[5],add_R[5],xor_R[5],S[0],S[1]);
four_to_one_mux  OPCODE6(R0[6],and_R[6],or_R[6],add_R[6],xor_R[6],S[0],S[1]);
four_to_one_mux  OPCODE7(R0[7],and_R[7],or_R[7],add_R[7],xor_R[7],S[0],S[1]);
four_to_one_mux  OPCODE8(R0[8],and_R[8],or_R[8],add_R[8],xor_R[8],S[0],S[1]);
four_to_one_mux  OPCODE9(R0[9],and_R[9],or_R[9],add_R[9],xor_R[9],S[0],S[1]);
four_to_one_mux  OPCODE10(R0[10],and_R[10],or_R[10],add_R[10],xor_R[10],S[0],S[1]); 
four_to_one_mux  OPCODE11(R0[11],and_R[11],or_R[11],add_R[11],xor_R[11],S[0],S[1]);
four_to_one_mux  OPCODE12(R0[12],and_R[12],or_R[12],add_R[12],xor_R[12],S[0],S[1]);
four_to_one_mux  OPCODE13(R0[13],and_R[13],or_R[13],add_R[13],xor_R[13],S[0],S[1]);
four_to_one_mux  OPCODE14(R0[14],and_R[14],or_R[14],add_R[14],xor_R[14],S[0],S[1]);
four_to_one_mux  OPCODE15(R0[15],and_R[15],or_R[15],add_R[15],xor_R[15],S[0],S[1]);
four_to_one_mux  OPCODE16(R0[16],and_R[16],or_R[16],add_R[16],xor_R[16],S[0],S[1]);
four_to_one_mux  OPCODE17(R0[17],and_R[17],or_R[17],add_R[17],xor_R[17],S[0],S[1]);
four_to_one_mux  OPCODE18(R0[18],and_R[18],or_R[18],add_R[18],xor_R[18],S[0],S[1]);
four_to_one_mux  OPCODE19(R0[19],and_R[19],or_R[19],add_R[19],xor_R[19],S[0],S[1]);
four_to_one_mux  OPCODE20(R0[20],and_R[20],or_R[20],add_R[20],xor_R[20],S[0],S[1]);
four_to_one_mux  OPCODE21(R0[21],and_R[21],or_R[21],add_R[21],xor_R[21],S[0],S[1]);
four_to_one_mux  OPCODE22(R0[22],and_R[22],or_R[22],add_R[22],xor_R[22],S[0],S[1]);
four_to_one_mux  OPCODE23(R0[23],and_R[23],or_R[23],add_R[23],xor_R[23],S[0],S[1]);
four_to_one_mux  OPCODE24(R0[24],and_R[24],or_R[24],add_R[24],xor_R[24],S[0],S[1]);
four_to_one_mux  OPCODE25(R0[25],and_R[25],or_R[25],add_R[25],xor_R[25],S[0],S[1]);
four_to_one_mux  OPCODE26(R0[26],and_R[26],or_R[26],add_R[26],xor_R[26],S[0],S[1]);
four_to_one_mux  OPCODE27(R0[27],and_R[27],or_R[27],add_R[27],xor_R[27],S[0],S[1]);
four_to_one_mux  OPCODE28(R0[28],and_R[28],or_R[28],add_R[28],xor_R[28],S[0],S[1]);
four_to_one_mux  OPCODE29(R0[29],and_R[29],or_R[29],add_R[29],xor_R[29],S[0],S[1]);
four_to_one_mux  OPCODE30(R0[30],and_R[30],or_R[30],add_R[30],xor_R[30],S[0],S[1]);
four_to_one_mux  OPCODE31(R0[31],and_R[31],or_R[31],add_R[31],xor_R[31],S[0],S[1]);


four_to_one_mux  OpCode2_0(R1[0],sub_R[0],rightAr_R[0],leftLo_R[0],nor_R[0],S[0],S[1]);
four_to_one_mux  OpCode2_1(R1[1],sub_R[1],rightAr_R[1],leftLo_R[1],nor_R[1],S[0],S[1]);
four_to_one_mux  OpCode2_2(R1[2],sub_R[2],rightAr_R[2],leftLo_R[2],nor_R[2],S[0],S[1]);
four_to_one_mux  OpCode2_3(R1[3],sub_R[3],rightAr_R[3],leftLo_R[3],nor_R[3],S[0],S[1]);
four_to_one_mux  OpCode2_4(R1[4],sub_R[4],rightAr_R[4],leftLo_R[4],nor_R[4],S[0],S[1]);
four_to_one_mux  OpCode2_5(R1[5],sub_R[5],rightAr_R[5],leftLo_R[5],nor_R[5],S[0],S[1]);
four_to_one_mux  OpCode2_6(R1[6],sub_R[6],rightAr_R[6],leftLo_R[6],nor_R[6],S[0],S[1]);
four_to_one_mux  OpCode2_7(R1[7],sub_R[7],rightAr_R[7],leftLo_R[7],nor_R[7],S[0],S[1]);
four_to_one_mux  OpCode2_8(R1[8],sub_R[8],rightAr_R[8],leftLo_R[8],nor_R[8],S[0],S[1]);
four_to_one_mux  OpCode2_9(R1[9],sub_R[9],rightAr_R[9],leftLo_R[9],nor_R[9],S[0],S[1]);
four_to_one_mux  OpCode2_10(R1[10],sub_R[10],rightAr_R[10],leftLo_R[10],nor_R[10],S[0],S[1]);
four_to_one_mux  OpCode2_11(R1[11],sub_R[11],rightAr_R[11],leftLo_R[11],nor_R[11],S[0],S[1]);
four_to_one_mux  OpCode2_12(R1[12],sub_R[12],rightAr_R[12],leftLo_R[12],nor_R[12],S[0],S[1]);
four_to_one_mux  OpCode2_13(R1[13],sub_R[13],rightAr_R[13],leftLo_R[13],nor_R[13],S[0],S[1]);
four_to_one_mux  OpCode2_14(R1[14],sub_R[14],rightAr_R[14],leftLo_R[14],nor_R[14],S[0],S[1]);
four_to_one_mux  OpCode2_15(R1[15],sub_R[15],rightAr_R[15],leftLo_R[15],nor_R[15],S[0],S[1]);
four_to_one_mux  OpCode2_16(R1[16],sub_R[16],rightAr_R[16],leftLo_R[16],nor_R[16],S[0],S[1]);
four_to_one_mux  OpCode2_17(R1[17],sub_R[17],rightAr_R[17],leftLo_R[17],nor_R[17],S[0],S[1]);
four_to_one_mux  OpCode2_18(R1[18],sub_R[18],rightAr_R[18],leftLo_R[18],nor_R[18],S[0],S[1]);
four_to_one_mux  OpCode2_19(R1[19],sub_R[19],rightAr_R[19],leftLo_R[19],nor_R[19],S[0],S[1]);
four_to_one_mux  OpCode2_20(R1[20],sub_R[20],rightAr_R[20],leftLo_R[20],nor_R[20],S[0],S[1]);
four_to_one_mux  OpCode2_21(R1[21],sub_R[21],rightAr_R[21],leftLo_R[21],nor_R[21],S[0],S[1]);
four_to_one_mux  OpCode2_22(R1[22],sub_R[22],rightAr_R[22],leftLo_R[22],nor_R[22],S[0],S[1]);
four_to_one_mux  OpCode2_23(R1[23],sub_R[23],rightAr_R[23],leftLo_R[23],nor_R[23],S[0],S[1]);
four_to_one_mux  OpCode2_24(R1[24],sub_R[24],rightAr_R[24],leftLo_R[24],nor_R[24],S[0],S[1]);
four_to_one_mux  OpCode2_25(R1[25],sub_R[25],rightAr_R[25],leftLo_R[25],nor_R[25],S[0],S[1]);
four_to_one_mux  OpCode2_26(R1[26],sub_R[26],rightAr_R[26],leftLo_R[26],nor_R[26],S[0],S[1]);
four_to_one_mux  OpCode2_27(R1[27],sub_R[27],rightAr_R[27],leftLo_R[27],nor_R[27],S[0],S[1]);
four_to_one_mux  OpCode2_28(R1[28],sub_R[28],rightAr_R[28],leftLo_R[28],nor_R[28],S[0],S[1]);
four_to_one_mux  OpCode2_29(R1[29],sub_R[29],rightAr_R[29],leftLo_R[29],nor_R[29],S[0],S[1]);
four_to_one_mux  OpCode2_30(R1[30],sub_R[30],rightAr_R[30],leftLo_R[30],nor_R[30],S[0],S[1]);
four_to_one_mux  OpCode2_31(R1[31],sub_R[31],rightAr_R[31],leftLo_R[31],nor_R[31],S[0],S[1]);

two_to_one_mux   Last_Result0(R[0],R0[0],R1[0],S[2]);
two_to_one_mux   Last_Result1(R[1],R0[1],R1[1],S[2]);
two_to_one_mux   Last_Result2(R[2],R0[2],R1[2],S[2]);
two_to_one_mux   Last_Result3(R[3],R0[3],R1[3],S[2]);
two_to_one_mux   Last_Result4(R[4],R0[4],R1[4],S[2]);
two_to_one_mux   Last_Result5(R[5],R0[5],R1[5],S[2]);
two_to_one_mux   Last_Result6(R[6],R0[6],R1[6],S[2]);
two_to_one_mux   Last_Result7(R[7],R0[7],R1[7],S[2]);
two_to_one_mux   Last_Result8(R[8],R0[8],R1[8],S[2]);
two_to_one_mux   Last_Result9(R[9],R0[9],R1[9],S[2]);
two_to_one_mux   Last_Result10(R[10],R0[10],R1[10],S[2]);
two_to_one_mux   Last_Result11(R[11],R0[11],R1[11],S[2]);
two_to_one_mux   Last_Result12(R[12],R0[12],R1[12],S[2]);
two_to_one_mux   Last_Result13(R[13],R0[13],R1[13],S[2]);
two_to_one_mux   Last_Result14(R[14],R0[14],R1[14],S[2]);
two_to_one_mux   Last_Result15(R[15],R0[15],R1[15],S[2]);
two_to_one_mux   Last_Result16(R[16],R0[16],R1[16],S[2]);
two_to_one_mux   Last_Result17(R[17],R0[17],R1[17],S[2]);
two_to_one_mux   Last_Result18(R[18],R0[18],R1[18],S[2]);
two_to_one_mux   Last_Result19(R[19],R0[19],R1[19],S[2]);
two_to_one_mux   Last_Result20(R[20],R0[20],R1[20],S[2]);
two_to_one_mux   Last_Result21(R[21],R0[21],R1[21],S[2]);
two_to_one_mux   Last_Result22(R[22],R0[22],R1[22],S[2]);
two_to_one_mux   Last_Result23(R[23],R0[23],R1[23],S[2]);
two_to_one_mux   Last_Result24(R[24],R0[24],R1[24],S[2]);
two_to_one_mux   Last_Result25(R[25],R0[25],R1[25],S[2]);
two_to_one_mux   Last_Result26(R[26],R0[26],R1[26],S[2]);
two_to_one_mux   Last_Result27(R[27],R0[27],R1[27],S[2]);
two_to_one_mux   Last_Result28(R[28],R0[28],R1[28],S[2]);
two_to_one_mux   Last_Result29(R[29],R0[29],R1[29],S[2]);
two_to_one_mux   Last_Result30(R[30],R0[30],R1[30],S[2]);
two_to_one_mux   Last_Result31(R[31],R0[31],R1[31],S[2]);

or zeroResultControl(zeroNotWire,R[0],R[1],R[2],
							R[3],R[4],R[5],R[6],
							R[7],R[8],R[9],R[10],
							R[11],R[12],R[13],R[14],
							R[15],R[16],R[17],R[18],
							R[19],R[20],R[21],R[22],
							R[21],R[22],R[23],R[24],
							R[25],R[26],R[27],R[30],
							R[31]
							);

not zeroResult(zerocontrol,zeroNotWire);

two_to_one_mux carry_out_Control(carry_out,add_R[32],sub_R[32],S[2]);
two_to_one_mux overflow_Control(overflow,overflowAdd,overflowSub,S[2]);


endmodule 