module nextPC(instruction,clock,result);
input[31:0] result;
//counteri -1 den başlattım branch ve jump aynı alwaysde yazabilmek için
reg signed [31:0] program_counter; 
output [31:0] instruction;						
input clock;
reg [25:0] jmpAdress;
reg [31:0] branchAdress;
reg [31:0] instr_mem [255:0];
reg [15:0] immediate;
reg [31:0]tempInstruction; //geçici bir instruction tutulur branch için
// programın başında modül çağrıldığı an instructionlar dosyadan çekilip arraye yazılıyor.

initial begin
	program_counter = 32'b00000000000000000000000000000000;
	$readmemb("instruction.mem", instr_mem);
end

always@(negedge clock)begin

tempInstruction[31:0] <= instruction[31:0];
end


 assign instruction = instr_mem[program_counter];

// PC değerine göre gerekli instruction arrayden çekiliyor.

always @(negedge clock)
begin  
   immediate = tempInstruction[15:0]; // immediate
	branchAdress[31:0] <= {{16{immediate[15]}}, immediate[15:0]}; // BranchAdress
	if(result == 32'b00000000000000000000000000000000)begin	
		//branch instruction için immediate + 1 değilse sadece +1	
		if(tempInstruction[31:26] == 6'b000100 )begin
			program_counter = program_counter + branchAdress; 
		end
	end		 
	 jmpAdress <= instruction[25:0]; // J type adress
	 //jump instruction ise immediate + 1 değilse sadece +1	
    if(tempInstruction[31:26] == 6'b000010 )begin
		program_counter = {program_counter[31:28], 2'b0,jmpAdress };
	 end
	 //jump olmadığı zaman program counter artar.
	 if(tempInstruction[31:26] != 6'b000010)begin
		program_counter = program_counter + 1;
	 end	 
end


endmodule