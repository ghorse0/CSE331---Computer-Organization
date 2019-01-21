
module mips32_single_cycle(instruction, result ,clock ,rTypeControl,rt_content1);

output rTypeControl;
wire sltunot4,sltunot2;
wire sltusignal;
wire addiusignal;
wire addiunot1,addiunot2,addiunot4,addiunot5;
wire [31:0] zeroORsign;
wire [31:0] rt_content3;
wire [31:0] read_data;
output [31:0] instruction;
output[31:0] result;
wire [2:0] select_bits_ALU;
wire [31:0] resultemp,resultemp2;
input clock;
wire write_sig;		
output [31:0] rt_content1;								//for write signal
wire[31:0] rs_content , rt_content2;	  //holds the values of rs and rt registers
wire[4:0] shamt;							   //holds shift amount
wire[4:0] rs , rt ,rd,Wrd; 						//for rs , rt and rd registers
wire[5:0] fun; 				//for func code
wire[5:0] opCode; 				//for op code
wire [2:0] S;
wire zerocontrol,overflow,carry_out;
wire [15:0] immediate;
wire [31:0] signextend;
wire [31:0] zeroextend;
wire [31:0] jAdress;
wire [31:0] mem_address;
wire [31:0] branchAdress;
wire rTypeControl;


nextPC nextAdress(instruction,clock,result);

buf fun0(fun[0],instruction[0]);
buf fun1(fun[1],instruction[1]);
buf fun2(fun[2],instruction[2]);
buf fun3(fun[3],instruction[3]);
buf fun4(fun[4],instruction[4]);
buf fun5(fun[5],instruction[5]);

buf op0(opCode[0],instruction[26]);
buf op1(opCode[1],instruction[27]);
buf op2(opCode[2],instruction[28]);
buf op3(opCode[3],instruction[29]);
buf op4(opCode[4],instruction[30]);
buf op5(opCode[5],instruction[31]);

control_unit select(select_bits_ALU, fun,opCode,rTypeControl);

//immediate 16 bit alınıyor.
buf imme0(immediate[0],instruction[0]);
buf imme1(immediate[1],instruction[1]);
buf imme2(immediate[2],instruction[2]);
buf imme3(immediate[3],instruction[3]);
buf imme4(immediate[4],instruction[4]);
buf imme5(immediate[5],instruction[5]);
buf imme6(immediate[6],instruction[6]);
buf imme7(immediate[7],instruction[7]);
buf imme8(immediate[8],instruction[8]);
buf imme9(immediate[9],instruction[9]);
buf imme10(immediate[10],instruction[10]);
buf imme11(immediate[11],instruction[11]);
buf imme12(immediate[12],instruction[12]);
buf imme13(immediate[13],instruction[13]);
buf imme14(immediate[14],instruction[14]);
buf imme15(immediate[15],instruction[15]);
							
buf rs0(rs[0],instruction[21]);
buf rs1(rs[1],instruction[22]);
buf rs2(rs[2],instruction[23]);
buf rs3(rs[3],instruction[24]);
buf rs4(rs[4],instruction[25]);

buf rt0(rt[0],instruction[16]);
buf rt1(rt[1],instruction[17]);
buf rt2(rt[2],instruction[18]);
buf rt3(rt[3],instruction[19]);
buf rt4(rt[4],instruction[20]);

buf rd0(rd[0],instruction[11]);
buf rd1(rd[1],instruction[12]);
buf rd2(rd[2],instruction[13]);
buf rd3(rd[3],instruction[14]);
buf rd4(rd[4],instruction[15]);

buf shamt0(shamt[0],instruction[6]);
buf shamt1(shamt[1],instruction[7]);
buf shamt2(shamt[2],instruction[8]);
buf shamt3(shamt[3],instruction[9]);
buf shamt4(shamt[4],instruction[10]);
  			
//make write signal 1

buf signalwrite(write_sig,0);	
		
//register girmeden R type veya I type göre seçim yapılır.
two_to_one_mux   rd_or_rt0(Wrd[0],rd[0],rt[0],rTypeControl);		
two_to_one_mux   rd_or_rt1(Wrd[1],rd[1],rt[1],rTypeControl);		
two_to_one_mux   rd_or_rt2(Wrd[2],rd[2],rt[2],rTypeControl);		
two_to_one_mux   rd_or_rt3(Wrd[3],rd[3],rt[3],rTypeControl);		
two_to_one_mux   rd_or_rt4(Wrd[4],rd[4],rt[4],rTypeControl);		
		
//call the mips_registers to read datas and/or write data

mips_registers read_contents(rs_content, rt_content1, resultemp, rs, rt, Wrd, write_sig, clock,rTypeControl);

// bir önceki ödevden hatalı olan rt yerine rs kaydırılıyordu.
//Düzeltildi.
wire notshift0,notshift2,notshift3,notshift4,notshift5;
wire signalshift1,signalshift2;
not shiftsignal0(notshift0,fun[0]);
not shiftsignal2(notshift2,fun[2]);
not shiftsignal3(notshift3,fun[3]);
not shiftsignal4(notshift4,fun[4]);
not shiftsignal5(notshift5,fun[5]);
and signalshifted(signalshift1,notshift0,notshift2,notshift3,notshift4,notshift5);

wire notrtype;
not shiftfor(notrtype,rTypeControl);
and randshift(signalshift2,signalshift1,notrtype);

two_to_one_mux   shamtornot0(rt_content2[0],rt_content1[0],shamt[0],signalshift2);
two_to_one_mux   shamtornot1(rt_content2[1],rt_content1[1],shamt[1],signalshift2);
two_to_one_mux   shamtornot2(rt_content2[2],rt_content1[2],shamt[2],signalshift2);
two_to_one_mux   shamtornot3(rt_content2[3],rt_content1[3],shamt[3],signalshift2);
two_to_one_mux   shamtornot4(rt_content2[4],rt_content1[4],shamt[4],signalshift2);
two_to_one_mux   shamtornot5(rt_content2[5],rt_content1[5],0,signalshift2);
two_to_one_mux   shamtornot6(rt_content2[6],rt_content1[6],0,signalshift2);
two_to_one_mux   shamtornot7(rt_content2[7],rt_content1[7],0,signalshift2);
two_to_one_mux   shamtornot8(rt_content2[8],rt_content1[8],0,signalshift2);
two_to_one_mux   shamtornot9(rt_content2[9],rt_content1[9],0,signalshift2);
two_to_one_mux   shamtornot10(rt_content2[10],rt_content1[10],0,signalshift2);
two_to_one_mux   shamtornot11(rt_content2[11],rt_content1[11],0,signalshift2);
two_to_one_mux   shamtornot12(rt_content2[12],rt_content1[12],0,signalshift2);
two_to_one_mux   shamtornot13(rt_content2[13],rt_content1[13],0,signalshift2);
two_to_one_mux   shamtornot14(rt_content2[14],rt_content1[14],0,signalshift2);
two_to_one_mux   shamtornot15(rt_content2[15],rt_content1[15],0,signalshift2);
two_to_one_mux   shamtornot16(rt_content2[16],rt_content1[16],0,signalshift2);
two_to_one_mux   shamtornot17(rt_content2[17],rt_content1[17],0,signalshift2);
two_to_one_mux   shamtornot18(rt_content2[18],rt_content1[18],0,signalshift2);
two_to_one_mux   shamtornot19(rt_content2[19],rt_content1[19],0,signalshift2);
two_to_one_mux   shamtornot20(rt_content2[20],rt_content1[20],0,signalshift2);
two_to_one_mux   shamtornot21(rt_content2[21],rt_content1[21],0,signalshift2);
two_to_one_mux   shamtornot22(rt_content2[22],rt_content1[22],0,signalshift2);
two_to_one_mux   shamtornot23(rt_content2[23],rt_content1[23],0,signalshift2);
two_to_one_mux   shamtornot24(rt_content2[24],rt_content1[24],0,signalshift2);
two_to_one_mux   shamtornot25(rt_content2[25],rt_content1[25],0,signalshift2);
two_to_one_mux   shamtornot26(rt_content2[26],rt_content1[26],0,signalshift2);
two_to_one_mux   shamtornot27(rt_content2[27],rt_content1[27],0,signalshift2);
two_to_one_mux   shamtornot28(rt_content2[28],rt_content1[28],0,signalshift2);
two_to_one_mux   shamtornot29(rt_content2[29],rt_content1[29],0,signalshift2);
two_to_one_mux   shamtornot30(rt_content2[30],rt_content1[30],0,signalshift2);
two_to_one_mux   shamtornot31(rt_content2[31],rt_content1[31],0,signalshift2);

sign_zero_extend extend(signextend,zeroextend,immediate);


not addiu1(addiunot1,opCode[1]);
not addiu2(addiunot2,opCode[2]);
not addiu4(addiunot4,opCode[4]);
not addiu5(addiunot5,opCode[5]);
and addiusig(addiusignal,addiunot1,addiunot2,addiunot4,addiunot5,
				 opCode[0],opCode[3]);
//addiu sinyaline göre sign veya zero extend seçilir.
zero_or_sign controlZS(zeroORsign,zeroextend,signextend,addiusignal);
				 

two_to_one_mux typeControl0(rt_content3[0],rt_content2[0],zeroORsign[0],rTypeControl);
two_to_one_mux typeControl1(rt_content3[1],rt_content2[1],zeroORsign[1],rTypeControl);
two_to_one_mux typeControl2(rt_content3[2],rt_content2[2],zeroORsign[2],rTypeControl);
two_to_one_mux typeControl3(rt_content3[3],rt_content2[3],zeroORsign[3],rTypeControl);
two_to_one_mux typeControl4(rt_content3[4],rt_content2[4],zeroORsign[4],rTypeControl);
two_to_one_mux typeControl5(rt_content3[5],rt_content2[5],zeroORsign[5],rTypeControl);
two_to_one_mux typeControl6(rt_content3[6],rt_content2[6],zeroORsign[6],rTypeControl);
two_to_one_mux typeControl7(rt_content3[7],rt_content2[7],zeroORsign[7],rTypeControl);
two_to_one_mux typeControl8(rt_content3[8],rt_content2[8],zeroORsign[8],rTypeControl);
two_to_one_mux typeControl9(rt_content3[9],rt_content2[9],zeroORsign[9],rTypeControl);
two_to_one_mux typeControl10(rt_content3[10],rt_content2[10],zeroORsign[10],rTypeControl);
two_to_one_mux typeControl11(rt_content3[11],rt_content2[11],zeroORsign[11],rTypeControl);
two_to_one_mux typeControl12(rt_content3[12],rt_content2[12],zeroORsign[12],rTypeControl);
two_to_one_mux typeControl13(rt_content3[13],rt_content2[13],zeroORsign[13],rTypeControl);
two_to_one_mux typeControl14(rt_content3[14],rt_content2[14],zeroORsign[14],rTypeControl);
two_to_one_mux typeControl15(rt_content3[15],rt_content2[15],zeroORsign[15],rTypeControl);
two_to_one_mux typeControl16(rt_content3[16],rt_content2[16],zeroORsign[16],rTypeControl);
two_to_one_mux typeControl17(rt_content3[17],rt_content2[17],zeroORsign[17],rTypeControl);
two_to_one_mux typeControl18(rt_content3[18],rt_content2[18],zeroORsign[18],rTypeControl);
two_to_one_mux typeControl19(rt_content3[19],rt_content2[19],zeroORsign[19],rTypeControl);
two_to_one_mux typeControl20(rt_content3[20],rt_content2[20],zeroORsign[20],rTypeControl);
two_to_one_mux typeControl21(rt_content3[21],rt_content2[21],zeroORsign[21],rTypeControl);
two_to_one_mux typeControl22(rt_content3[22],rt_content2[22],zeroORsign[22],rTypeControl);
two_to_one_mux typeControl23(rt_content3[23],rt_content2[23],zeroORsign[23],rTypeControl);
two_to_one_mux typeControl24(rt_content3[24],rt_content2[24],zeroORsign[24],rTypeControl);
two_to_one_mux typeControl25(rt_content3[25],rt_content2[25],zeroORsign[25],rTypeControl);
two_to_one_mux typeControl26(rt_content3[26],rt_content2[26],zeroORsign[26],rTypeControl);
two_to_one_mux typeControl27(rt_content3[27],rt_content2[27],zeroORsign[27],rTypeControl);
two_to_one_mux typeControl28(rt_content3[28],rt_content2[28],zeroORsign[28],rTypeControl);
two_to_one_mux typeControl29(rt_content3[29],rt_content2[29],zeroORsign[29],rTypeControl);
two_to_one_mux typeControl30(rt_content3[30],rt_content2[30],zeroORsign[30],rTypeControl);
two_to_one_mux typeControl31(rt_content3[31],rt_content2[31],zeroORsign[31],rTypeControl);
				 
				 
				 
//slt sll sorunu çözüldü. 
alu32 calculate(resultemp ,select_bits_ALU,rs_content,rt_content3,zerocontrol,overflow,carry_out);

not sltuno(sltunot4,fun[4]);
not sltunot(sltunot2,fun[2]);

and sltusig(sltusignal,fun[5],sltunot4,fun[3],sltunot2,fun[1],fun[0]);


two_to_one_mux checkslu1(resultemp2[0],resultemp[0],resultemp[31],sltusignal);
two_to_one_mux checkslu2(resultemp2[1],resultemp[1],0,sltusignal);
two_to_one_mux checkslu3(resultemp2[2],resultemp[2],0,sltusignal);
two_to_one_mux checkslu4(resultemp2[3],resultemp[3],0,sltusignal);
two_to_one_mux checkslu5(resultemp2[4],resultemp[4],0,sltusignal);
two_to_one_mux checkslu6(resultemp2[5],resultemp[5],0,sltusignal);
two_to_one_mux checkslu7(resultemp2[6],resultemp[6],0,sltusignal);
two_to_one_mux checkslu8(resultemp2[7],resultemp[7],0,sltusignal);
two_to_one_mux checkslu9(resultemp2[8],resultemp[8],0,sltusignal);
two_to_one_mux checkslu10(resultemp2[9],resultemp[9],0,sltusignal);
two_to_one_mux checkslu11(resultemp2[10],resultemp[10],0,sltusignal);
two_to_one_mux checkslu12(resultemp2[11],resultemp[11],0,sltusignal);
two_to_one_mux checkslu13(resultemp2[12],resultemp[12],0,sltusignal);
two_to_one_mux checkslu14(resultemp2[13],resultemp[13],0,sltusignal);
two_to_one_mux checkslu15(resultemp2[14],resultemp[14],0,sltusignal);
two_to_one_mux checkslu16(resultemp2[15],resultemp[15],0,sltusignal);
two_to_one_mux checkslu17(resultemp2[16],resultemp[16],0,sltusignal);
two_to_one_mux checkslu18(resultemp2[17],resultemp[17],0,sltusignal);
two_to_one_mux checkslu19(resultemp2[18],resultemp[18],0,sltusignal);
two_to_one_mux checkslu20(resultemp2[19],resultemp[19],0,sltusignal);
two_to_one_mux checkslu21(resultemp2[20],resultemp[20],0,sltusignal);
two_to_one_mux checkslu22(resultemp2[21],resultemp[21],0,sltusignal);
two_to_one_mux checkslu23(resultemp2[22],resultemp[22],0,sltusignal);
two_to_one_mux checkslu24(resultemp2[23],resultemp[23],0,sltusignal);
two_to_one_mux checkslu25(resultemp2[24],resultemp[24],0,sltusignal);
two_to_one_mux checkslu26(resultemp2[25],resultemp[25],0,sltusignal);
two_to_one_mux checkslu27(resultemp2[26],resultemp[26],0,sltusignal);
two_to_one_mux checkslu28(resultemp2[27],resultemp[27],0,sltusignal);
two_to_one_mux checkslu29(resultemp2[28],resultemp[28],0,sltusignal);
two_to_one_mux checkslu30(resultemp2[29],resultemp[29],0,sltusignal);
two_to_one_mux checkslu31(resultemp2[30],resultemp[30],0,sltusignal);
two_to_one_mux checkslu32(resultemp2[31],resultemp[31],0,sltusignal);

//----------lw signal-------
wire lwsignal3,lwsignal5;
not lwnot3(lwsignal3,opCode[3]);
not lwnot5(lwsignal5,opCode[5]);

wire lwsignal;
and lwsig(lwsignal,lwsignal5,opCode[4],lwsignal3,opCode[2],opCode[1],opCode[0]);

//memorye eğer lw veya sw ise işlem yapıyor.
mips_data_memory call_data_memory(read_data, resultemp2, rt_content1,
										opCode,clock);
//lw ise memoryden alınan değer result olur.
two_to_one_mux lastResult0(result[0],resultemp2[0],read_data[0],lwsignal);										
two_to_one_mux lastResult1(result[1],resultemp2[1],read_data[1],lwsignal);										
two_to_one_mux lastResult2(result[2],resultemp2[2],read_data[2],lwsignal);										
two_to_one_mux lastResult3(result[3],resultemp2[3],read_data[3],lwsignal);										
two_to_one_mux lastResult4(result[4],resultemp2[4],read_data[4],lwsignal);										
two_to_one_mux lastResult5(result[5],resultemp2[5],read_data[5],lwsignal);										
two_to_one_mux lastResult6(result[6],resultemp2[6],read_data[6],lwsignal);										
two_to_one_mux lastResult7(result[7],resultemp2[7],read_data[7],lwsignal);										
two_to_one_mux lastResult8(result[8],resultemp2[8],read_data[8],lwsignal);										
two_to_one_mux lastResult9(result[9],resultemp2[9],read_data[9],lwsignal);										
two_to_one_mux lastResult10(result[10],resultemp2[10],read_data[10],lwsignal);										
two_to_one_mux lastResult11(result[11],resultemp2[11],read_data[11],lwsignal);										
two_to_one_mux lastResult12(result[12],resultemp2[12],read_data[12],lwsignal);										
two_to_one_mux lastResult13(result[13],resultemp2[13],read_data[13],lwsignal);										
two_to_one_mux lastResult14(result[14],resultemp2[14],read_data[14],lwsignal);										
two_to_one_mux lastResult15(result[15],resultemp2[15],read_data[15],lwsignal);										
two_to_one_mux lastResult16(result[16],resultemp2[16],read_data[16],lwsignal);										
two_to_one_mux lastResult17(result[17],resultemp2[17],read_data[17],lwsignal);										
two_to_one_mux lastResult18(result[18],resultemp2[18],read_data[18],lwsignal);										
two_to_one_mux lastResult19(result[19],resultemp2[19],read_data[19],lwsignal);										
two_to_one_mux lastResult20(result[20],resultemp2[20],read_data[20],lwsignal);										
two_to_one_mux lastResult21(result[21],resultemp2[21],read_data[21],lwsignal);										
two_to_one_mux lastResult22(result[22],resultemp2[22],read_data[22],lwsignal);										
two_to_one_mux lastResult23(result[23],resultemp2[23],read_data[23],lwsignal);										
two_to_one_mux lastResult24(result[24],resultemp2[24],read_data[24],lwsignal);										
two_to_one_mux lastResult25(result[25],resultemp2[25],read_data[25],lwsignal);										
two_to_one_mux lastResult26(result[26],resultemp2[26],read_data[26],lwsignal);										
two_to_one_mux lastResult27(result[27],resultemp2[27],read_data[27],lwsignal);										
two_to_one_mux lastResult28(result[28],resultemp2[28],read_data[28],lwsignal);										
two_to_one_mux lastResult29(result[29],resultemp2[29],read_data[29],lwsignal);										
two_to_one_mux lastResult30(result[30],resultemp2[30],read_data[30],lwsignal);										
two_to_one_mux lastResult31(result[31],resultemp2[31],read_data[31],lwsignal);										
										
										
endmodule 