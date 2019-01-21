module control_unit(select_bits_ALU, function_code,opCode,rTypeControl);

output rTypeControl;
input [5:0] opCode;
input [5:0] function_code;
output [2:0] select_bits_ALU;
wire [2:0] select_bits_ALU_R;
wire notfunc1;wire notfunc2;wire notfunc5;
wire select1_and1; 
wire select0_and1; 
wire select0_and2;
wire select1_and2;


not notfunc_1(notfunc1,function_code[1]);
not notfunc_2(notfunc2,function_code[2]);
not notfunc_5(notfunc5,function_code[5]);

// R için funtion code bakılıp seçme bitleri bulunur.
or selector2(select_bits_ALU_R[2],function_code[1],notfunc5); //select 2

and firstand1(select1_and1,notfunc2,notfunc1);
and secondand1(select1_and2,function_code[2],function_code[1]);
or selector1(select_bits_ALU_R[1],select1_and1,select1_and2); //select 1

and firstand0(select0_and1,notfunc5,function_code[1]);
and secondand0(select0_and2,function_code[2],function_code[0]);
or selector0(select_bits_ALU_R[0],select0_and1,select0_and2); //select 0

//I type ve J type için opcode bakılıp seçme bitleri bulunur.
//andi , ori , addi ,lw, sw , beq , j için sinyal
wire notopcode1,notopcode2,notopcode3;
wire [2:0] select_bits_ALU_I_J;


not notopcode_1(notopcode1,opCode[1]);
not notopcode_2(notopcode2,opCode[2]);
not notopcode_3(notopcode3,opCode[3]);

and firstSel(select_bits_ALU_I_J[2],notopcode3,notopcode1);
buf secondSel(select_bits_ALU_I_J[1],notopcode2);
and thirdSel(select_bits_ALU_I_J[0],opCode[2],opCode[0]);

//r type ise opcode sıfır olacak 1 ise I veya J type 0 ise R type
or rtype(rTypeControl,opCode[0],opCode[1],opCode[2],opCode[3]
							,opCode[4],opCode[5]);

two_to_one_mux ALU_Select0(select_bits_ALU[0],select_bits_ALU_R[0],select_bits_ALU_I_J[0],rTypeControl);
two_to_one_mux ALU_Select1(select_bits_ALU[1],select_bits_ALU_R[1],select_bits_ALU_I_J[1],rTypeControl);
two_to_one_mux ALU_Select2(select_bits_ALU[2],select_bits_ALU_R[2],select_bits_ALU_I_J[2],rTypeControl);

						
endmodule 