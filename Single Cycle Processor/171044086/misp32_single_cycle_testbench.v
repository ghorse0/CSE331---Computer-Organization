module mips32_single_cycle_testbench ();
reg clock;
wire [31:0] instruction_set;
wire[31:0] result;
reg[31:0] registers[31:0];
wire [2:0] select_bits_ALU;
wire [31:0] rt_content;
reg [31:0] data_memory  [255:0];

initial clock = 0;

// ************************************************************
// Her bir instruction 2 clock sürecektir.
// ************************************************************
// Simülasyonda sonuç çıktısında Clock değerinin 1 olduğu durumdaki çıktılar gerçek sonuçlardır.Clock: 1 yazan çıktıları dikkate alınız.
// ************************************************************

initial begin
	    clock=~clock;  
	#50 clock=~clock; 
	#50 clock=~clock;  
	#50 clock=~clock; 
	#50 clock=~clock; 
	#50 clock=~clock;
	#50 clock=~clock; 
	#50 clock=~clock;
	#50 clock=~clock; 
	#50 clock=~clock;
	#50 clock=~clock; 
	#50 clock=~clock;
	#50 clock=~clock; 
	#50 clock=~clock;
	#50 clock=~clock; 
	#50 clock=~clock;
	#50 clock=~clock; 
	#50 clock=~clock;  
	#50 clock=~clock; 
	#50 clock=~clock;  
	#50 clock=~clock; 
	#50 clock=~clock;
	#50 clock=~clock;  
	#50 clock=~clock; 
	#50 clock=~clock;  
	#50 clock=~clock; 
	#50 clock=~clock;
	#50 clock=~clock;
	#50 clock=~clock;  
	#50 clock=~clock; 
	#50 clock=~clock;  	
end

mips32_single_cycle run_instruction(instruction_set , result,clock,rTypeControl,rt_content);
// ------------register process
always @(clock)
begin
$readmemb("registers.mem" , registers);
			//branch veya jump olduğunda ragistera yazmaz
			if(!rTypeControl)begin
				if (instruction_set[15:11] != 5'b00000&& instruction_set[31:26] != 6'b000100 
		         && instruction_set[31:26] != 6'b000010 )begin
					registers[instruction_set[15:11]] = result;
			end	
			end
			//branch veya jump olduğunda ragistera yazmaz
			if(rTypeControl)begin
				if(instruction_set[20:16] != 5'b00000&& instruction_set[31:26] != 6'b000100
			     && instruction_set[31:26] != 6'b000010)begin	
					registers[instruction_set[20:16]] = result;
				end
			end	
	
	//sw ise yazmaz registara
	//branch veya jump olduğunda ragistera yazmaz
	if (instruction_set[31:26] !=6'b101011&& instruction_set[31:26] != 6'b000100
      && instruction_set[31:26] != 6'b000010)begin	
		$writememb("registers.mem" , registers);
	end
end

//----------memory process

always @(clock) begin
	$readmemb("data.mem" , data_memory);
	//sonuc değer hem data memory yazılır hemde dosyaya
	if (instruction_set[31:26] == 6'b101011 ) begin
		data_memory[result] = rt_content;
		$writememb("data.mem", data_memory);
	end
end

initial
begin
$monitor("time = %2d, instruction =%32b \nrs = %5b ,rt = %5b , rd=%5b result=%32b clock=%1b", $time, instruction_set,instruction_set[25:21],instruction_set[20:16],instruction_set[15:11], result,clock);
end

endmodule