//addiu sinyaline göre sign veya zero extend seçilir.
module zero_or_sign(zeroORsignExtend,zeroExtend,signExtend,addiusignal);

output[31:0] zeroORsignExtend;
input addiusignal;
input [31:0]zeroExtend;
input [31:0]signExtend;


two_to_one_mux control0(zeroORsignExtend[0],signExtend[0],zeroExtend[0],addiusignal);
two_to_one_mux control1(zeroORsignExtend[1],signExtend[1],zeroExtend[1],addiusignal);
two_to_one_mux control2(zeroORsignExtend[2],signExtend[2],zeroExtend[2],addiusignal);
two_to_one_mux control3(zeroORsignExtend[3],signExtend[3],zeroExtend[3],addiusignal);
two_to_one_mux control4(zeroORsignExtend[4],signExtend[4],zeroExtend[4],addiusignal);
two_to_one_mux control5(zeroORsignExtend[5],signExtend[5],zeroExtend[5],addiusignal);
two_to_one_mux control6(zeroORsignExtend[6],signExtend[6],zeroExtend[6],addiusignal);
two_to_one_mux control7(zeroORsignExtend[7],signExtend[7],zeroExtend[7],addiusignal);
two_to_one_mux control8(zeroORsignExtend[8],signExtend[8],zeroExtend[8],addiusignal);
two_to_one_mux control9(zeroORsignExtend[9],signExtend[9],zeroExtend[9],addiusignal);
two_to_one_mux control10(zeroORsignExtend[10],signExtend[10],zeroExtend[10],addiusignal);
two_to_one_mux control11(zeroORsignExtend[11],signExtend[11],zeroExtend[11],addiusignal);
two_to_one_mux control12(zeroORsignExtend[12],signExtend[12],zeroExtend[12],addiusignal);
two_to_one_mux control13(zeroORsignExtend[13],signExtend[13],zeroExtend[13],addiusignal);
two_to_one_mux control14(zeroORsignExtend[14],signExtend[14],zeroExtend[14],addiusignal);
two_to_one_mux control15(zeroORsignExtend[15],signExtend[15],zeroExtend[15],addiusignal);
two_to_one_mux control16(zeroORsignExtend[16],signExtend[16],zeroExtend[16],addiusignal);
two_to_one_mux control17(zeroORsignExtend[17],signExtend[17],zeroExtend[17],addiusignal);
two_to_one_mux control18(zeroORsignExtend[18],signExtend[18],zeroExtend[18],addiusignal);
two_to_one_mux control19(zeroORsignExtend[19],signExtend[19],zeroExtend[19],addiusignal);
two_to_one_mux control20(zeroORsignExtend[20],signExtend[20],zeroExtend[20],addiusignal);
two_to_one_mux control21(zeroORsignExtend[21],signExtend[21],zeroExtend[21],addiusignal);
two_to_one_mux control22(zeroORsignExtend[22],signExtend[22],zeroExtend[22],addiusignal);
two_to_one_mux control23(zeroORsignExtend[23],signExtend[23],zeroExtend[23],addiusignal);
two_to_one_mux control24(zeroORsignExtend[24],signExtend[24],zeroExtend[24],addiusignal);
two_to_one_mux control25(zeroORsignExtend[25],signExtend[25],zeroExtend[25],addiusignal);
two_to_one_mux control26(zeroORsignExtend[26],signExtend[26],zeroExtend[26],addiusignal);
two_to_one_mux control27(zeroORsignExtend[27],signExtend[27],zeroExtend[27],addiusignal);
two_to_one_mux control28(zeroORsignExtend[28],signExtend[28],zeroExtend[28],addiusignal);
two_to_one_mux control29(zeroORsignExtend[29],signExtend[29],zeroExtend[29],addiusignal);
two_to_one_mux control30(zeroORsignExtend[30],signExtend[30],zeroExtend[30],addiusignal);
two_to_one_mux control31(zeroORsignExtend[31],signExtend[31],zeroExtend[31],addiusignal);

 endmodule 