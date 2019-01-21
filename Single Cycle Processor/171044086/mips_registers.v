module mips_registers
( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk,rTypeControl );

	input rTypeControl;
	output [31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [4:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	
	reg [31:0] registers [31:0];
	
	
	// will be run only one time 
	initial begin 
		$readmemb("registers.mem", registers);
	end
	//Eğer I type ise rt registerina R ise rd registerina yazıyor.
	//"$Zero" register will no be written . the register is always "zero". 
	//every postive edge of the clock, the code below will be executed
	always @ (negedge clk) begin
		if (signal_reg_write && (write_reg != 5'b00000 ) ) begin
			if(!rTypeControl)begin
				registers[write_reg] = write_data;
		
			end
			if(rTypeControl)begin
				registers[read_reg_2] = write_data;
			end
		end
	end
	assign read_data_1 = registers[read_reg_1];
	assign read_data_2 = registers[read_reg_2];
endmodule