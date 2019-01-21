module mips_data_memory (read_data, memory_address, write_data, opCode,clock);
output [31:0] read_data;
input [31:0] memory_address;
input [31:0] write_data;
reg [31:0] data_memory  [255:0];
reg [31:0] read_data;
input clock;
input [5:0] opCode;
initial begin
	$readmemb("data.mem", data_memory);
end

always @(posedge clock) 
begin
	//sonuc değer hem data memory yazılır hemde dosyaya
	if (opCode == 6'b101011) begin
		data_memory[memory_address] = write_data;
	end
end

always @(negedge clock)begin
	if (opCode == 6'b010111) begin
		read_data = data_memory[memory_address[7:0]];
	end
end

endmodule 