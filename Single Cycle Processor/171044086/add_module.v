module add_A_B(add_R,A,B,overflow);

output [32:0] add_R;
input  [31:0] A,B;

output overflow;

wire [32:0] carry_out;

full_adder  add1(add_R[0],carry_out[1],0,A[0],B[0]);
full_adder  add2(add_R[1],carry_out[2],carry_out[1],A[1],B[1]);
full_adder  add3(add_R[2],carry_out[3],carry_out[2],A[2],B[2]);
full_adder  add4(add_R[3],carry_out[4],carry_out[3],A[3],B[3]);
full_adder  add5(add_R[4],carry_out[5],carry_out[4],A[4],B[4]);
full_adder  add6(add_R[5],carry_out[6],carry_out[5],A[5],B[5]);
full_adder  add7(add_R[6],carry_out[7],carry_out[6],A[6],B[6]);
full_adder  add8(add_R[7],carry_out[8],carry_out[7],A[7],B[7]);
full_adder  add9(add_R[8],carry_out[9],carry_out[8],A[8],B[8]);
full_adder  add10(add_R[9],carry_out[10],carry_out[9],A[9],B[9]);
full_adder  add11(add_R[10],carry_out[11],carry_out[10],A[10],B[10]);
full_adder  add12(add_R[11],carry_out[12],carry_out[11],A[11],B[11]);
full_adder  add13(add_R[12],carry_out[13],carry_out[12],A[12],B[12]);
full_adder  add14(add_R[13],carry_out[14],carry_out[13],A[13],B[13]);
full_adder  add15(add_R[14],carry_out[15],carry_out[14],A[14],B[14]);
full_adder  add16(add_R[15],carry_out[16],carry_out[15],A[15],B[15]);
full_adder  add17(add_R[16],carry_out[17],carry_out[16],A[16],B[16]);
full_adder  add18(add_R[17],carry_out[18],carry_out[17],A[17],B[17]);
full_adder  add19(add_R[18],carry_out[19],carry_out[18],A[18],B[18]);
full_adder  add20(add_R[19],carry_out[20],carry_out[19],A[19],B[19]);
full_adder  add21(add_R[20],carry_out[21],carry_out[20],A[20],B[20]);
full_adder  add22(add_R[21],carry_out[22],carry_out[21],A[21],B[21]);
full_adder  add23(add_R[22],carry_out[23],carry_out[22],A[22],B[22]);
full_adder  add24(add_R[23],carry_out[24],carry_out[23],A[23],B[23]);
full_adder  add25(add_R[24],carry_out[25],carry_out[24],A[24],B[24]);
full_adder  add26(add_R[25],carry_out[26],carry_out[25],A[25],B[25]);
full_adder  add27(add_R[26],carry_out[27],carry_out[26],A[26],B[26]);
full_adder  add28(add_R[27],carry_out[28],carry_out[27],A[27],B[27]);
full_adder  add29(add_R[28],carry_out[29],carry_out[28],A[28],B[28]);
full_adder  add30(add_R[29],carry_out[30],carry_out[29],A[29],B[29]);
full_adder  add31(add_R[30],carry_out[31],carry_out[30],A[30],B[30]);
full_adder  add32(add_R[31],carry_out[32],carry_out[31],A[31],B[31]);

buf carry_outControl(add_R[32],carry_out[32]);
xor overflowControl(overflow,carry_out[32],carry_out[31]);

endmodule 