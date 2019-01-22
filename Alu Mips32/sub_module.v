module sub_A_B(sub_R,A,B,overflowSub);

output [32:0] sub_R;
input [31:0] A,B;
output overflowSub;

wire [32:0] carry_out,carry_outb,B_not,Opposite_B;

not twoComplement1(B_not[0],B[0]);
not twoComplement2(B_not[1],B[1]);
not twoComplement3(B_not[2],B[2]);
not twoComplement4(B_not[3],B[3]);
not twoComplement5(B_not[4],B[4]);
not twoComplement6(B_not[5],B[5]);
not twoComplement7(B_not[6],B[6]);
not twoComplement8(B_not[7],B[7]);
not twoComplement9(B_not[8],B[8]);
not twoComplement10(B_not[9],B[9]);
not twoComplement11(B_not[10],B[10]);
not twoComplement12(B_not[11],B[11]);
not twoComplement13(B_not[12],B[12]);
not twoComplement14(B_not[13],B[13]);
not twoComplement15(B_not[14],B[14]);
not twoComplement16(B_not[15],B[15]);
not twoComplement17(B_not[16],B[16]);
not twoComplement18(B_not[17],B[17]);
not twoComplement19(B_not[18],B[18]);
not twoComplement20(B_not[19],B[19]);
not twoComplement21(B_not[20],B[20]);
not twoComplement22(B_not[21],B[21]);
not twoComplement23(B_not[22],B[22]);
not twoComplement24(B_not[23],B[23]);
not twoComplement25(B_not[24],B[24]);
not twoComplement26(B_not[25],B[25]);
not twoComplement27(B_not[26],B[26]);
not twoComplement28(B_not[27],B[27]);
not twoComplement29(B_not[28],B[28]);
not twoComplement30(B_not[29],B[29]);
not twoComplement31(B_not[30],B[30]);
not twoComplement32(B_not[31],B[31]);

full_adder addB1(Opposite_B[0],carry_outb[1],0,B_not[0],1);
full_adder addB2(Opposite_B[1],carry_outb[2],carry_outb[1],B_not[1],0);
full_adder addB3(Opposite_B[2],carry_outb[3],carry_outb[2],B_not[2],0);
full_adder addB4(Opposite_B[3],carry_outb[4],carry_outb[3],B_not[3],0);
full_adder addB5(Opposite_B[4],carry_outb[5],carry_outb[4],B_not[4],0);
full_adder addB6(Opposite_B[5],carry_outb[6],carry_outb[5],B_not[5],0);
full_adder addB7(Opposite_B[6],carry_outb[7],carry_outb[6],B_not[6],0);
full_adder addB8(Opposite_B[7],carry_outb[8],carry_outb[7],B_not[7],0);
full_adder addB9(Opposite_B[8],carry_outb[9],carry_outb[8],B_not[8],0);
full_adder addB10(Opposite_B[9],carry_outb[10],carry_outb[9],B_not[9],0);
full_adder addB11(Opposite_B[10],carry_outb[11],carry_outb[10],B_not[10],0);
full_adder addB12(Opposite_B[11],carry_outb[12],carry_outb[11],B_not[11],0);
full_adder addB13(Opposite_B[12],carry_outb[13],carry_outb[12],B_not[12],0);
full_adder addB14(Opposite_B[13],carry_outb[14],carry_outb[13],B_not[13],0);
full_adder addB15(Opposite_B[14],carry_outb[15],carry_outb[14],B_not[14],0);
full_adder addB16(Opposite_B[15],carry_outb[16],carry_outb[15],B_not[15],0);
full_adder addB17(Opposite_B[16],carry_outb[17],carry_outb[16],B_not[16],0);
full_adder addB18(Opposite_B[17],carry_outb[18],carry_outb[17],B_not[17],0);
full_adder addB19(Opposite_B[18],carry_outb[19],carry_outb[18],B_not[18],0);
full_adder addB20(Opposite_B[19],carry_outb[20],carry_outb[19],B_not[19],0);
full_adder addB21(Opposite_B[20],carry_outb[21],carry_outb[20],B_not[20],0);
full_adder addB22(Opposite_B[21],carry_outb[22],carry_outb[21],B_not[21],0);
full_adder addB23(Opposite_B[22],carry_outb[23],carry_outb[22],B_not[22],0);
full_adder addB24(Opposite_B[23],carry_outb[24],carry_outb[23],B_not[23],0);
full_adder addB25(Opposite_B[24],carry_outb[25],carry_outb[24],B_not[24],0);
full_adder addB26(Opposite_B[25],carry_outb[26],carry_outb[25],B_not[25],0);
full_adder addB27(Opposite_B[26],carry_outb[27],carry_outb[26],B_not[26],0);
full_adder addB28(Opposite_B[27],carry_outb[28],carry_outb[27],B_not[27],0);
full_adder addB29(Opposite_B[28],carry_outb[29],carry_outb[28],B_not[28],0);
full_adder addB30(Opposite_B[29],carry_outb[30],carry_outb[29],B_not[29],0);
full_adder addB31(Opposite_B[30],carry_outb[31],carry_outb[30],B_not[30],0);
full_adder addB32(Opposite_B[31],carry_outb[32],carry_outb[31],B_not[31],0);


full_adder  add1(sub_R[0],carry_out[1],0,A[0],Opposite_B[0]);
full_adder  add2(sub_R[1],carry_out[2],carry_out[1],A[1],Opposite_B[1]);
full_adder  add3(sub_R[2],carry_out[3],carry_out[2],A[2],Opposite_B[2]);
full_adder  add4(sub_R[3],carry_out[4],carry_out[3],A[3],Opposite_B[3]);
full_adder  add5(sub_R[4],carry_out[5],carry_out[4],A[4],Opposite_B[4]);
full_adder  add6(sub_R[5],carry_out[6],carry_out[5],A[5],Opposite_B[5]);
full_adder  add7(sub_R[6],carry_out[7],carry_out[6],A[6],Opposite_B[6]);
full_adder  add8(sub_R[7],carry_out[8],carry_out[7],A[7],Opposite_B[7]);
full_adder  add9(sub_R[8],carry_out[9],carry_out[8],A[8],Opposite_B[8]);
full_adder  add10(sub_R[9],carry_out[10],carry_out[9],A[9],Opposite_B[9]);
full_adder  add11(sub_R[10],carry_out[11],carry_out[10],A[10],Opposite_B[10]);
full_adder  add12(sub_R[11],carry_out[12],carry_out[11],A[11],Opposite_B[11]);
full_adder  add13(sub_R[12],carry_out[13],carry_out[12],A[12],Opposite_B[12]);
full_adder  add14(sub_R[13],carry_out[14],carry_out[13],A[13],Opposite_B[13]);
full_adder  add15(sub_R[14],carry_out[15],carry_out[14],A[14],Opposite_B[14]);
full_adder  add16(sub_R[15],carry_out[16],carry_out[15],A[15],Opposite_B[15]);
full_adder  add17(sub_R[16],carry_out[17],carry_out[16],A[16],Opposite_B[16]);
full_adder  add18(sub_R[17],carry_out[18],carry_out[17],A[17],Opposite_B[17]);
full_adder  add19(sub_R[18],carry_out[19],carry_out[18],A[18],Opposite_B[18]);
full_adder  add20(sub_R[19],carry_out[20],carry_out[19],A[19],Opposite_B[19]);
full_adder  add21(sub_R[20],carry_out[21],carry_out[20],A[20],Opposite_B[20]);
full_adder  add22(sub_R[21],carry_out[22],carry_out[21],A[21],Opposite_B[21]);
full_adder  add23(sub_R[22],carry_out[23],carry_out[22],A[22],Opposite_B[22]);
full_adder  add24(sub_R[23],carry_out[24],carry_out[23],A[23],Opposite_B[23]);
full_adder  add25(sub_R[24],carry_out[25],carry_out[24],A[24],Opposite_B[24]);
full_adder  add26(sub_R[25],carry_out[26],carry_out[25],A[25],Opposite_B[25]);
full_adder  add27(sub_R[26],carry_out[27],carry_out[26],A[26],Opposite_B[26]);
full_adder  add28(sub_R[27],carry_out[28],carry_out[27],A[27],Opposite_B[27]);
full_adder  add29(sub_R[28],carry_out[29],carry_out[28],A[28],Opposite_B[28]);
full_adder  add30(sub_R[29],carry_out[30],carry_out[29],A[29],Opposite_B[29]);
full_adder  add31(sub_R[30],carry_out[31],carry_out[30],A[30],Opposite_B[30]);
full_adder  add32(sub_R[31],carry_out[32],carry_out[31],A[31],Opposite_B[31]);

buf carry_outControl(sub_R[32],carry_out[32]);

xor overflowControl(overflowSub,carry_out[32],carry_out[31]);


endmodule 