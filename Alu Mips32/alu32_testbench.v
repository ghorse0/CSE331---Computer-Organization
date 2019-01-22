module alu32_testbench();

reg [31:0] firstinput ,secondinput;

reg [3:0] select;

wire overflow,zerocontrol,carry_out;

wire [31:0] R ;

alu32 examplee(R,select,firstinput,secondinput,zerocontrol,overflow,
					carry_out);

initial begin

firstinput = 32'b11111100000000000100000010001001;
secondinput = 32'b00000000000000000000000000001111;

select = 3'b000;
#10
$display("A = %32b B = %32b Result = %32b Select : 000\nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b001;
#10
$display("A = %32b B = %32b Result = %32b Select : 001 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b ",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b010;
#10
$display("A = %32b B = %32b Result = %32b Select : 010 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b011;
#10
$display("A = %32b B = %32b Result = %32b Select : 011 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b ",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b100;
#10
$display("A = %32b B = %32b Result = %32b Select : 100 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b101;
#10
$display("A = %32b B = %32b Result = %32b Select : 101 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b110;
#10
$display("A = %32b B = %32b Result = %32b Select : 110 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b111;
#10
$display("A = %32b B = %32b Result = %32b Select : 111 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

firstinput = 32'b11111100000000100000111111101001;
secondinput = 32'b10000000100100001000111111010011;

select = 3'b000;
#10
$display("A = %32b B = %32b Result = %32b Select : 000\nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b ",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b001;
#10
$display("A = %32b B = %32b Result = %32b Select : 001 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b ",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b010;
#10
$display("A = %32b B = %32b Result = %32b Select : 010 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b011;
#10
$display("A = %32b B = %32b Result = %32b Select : 011 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b ",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b100;
#10
$display("A = %32b B = %32b Result = %32b Select : 100 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b101;
#10
$display("A = %32b B = %32b Result = %32b Select : 101 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b110;
#10
$display("A = %32b B = %32b Result = %32b Select : 110 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b111;
#10
$display("A = %32b B = %32b Result = %32b Select : 111 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);


firstinput = 32'b00000100001111111111111111111111;
secondinput = 32'b00000100001111111111111111111111;

select = 3'b000;
#10
$display("A = %32b B = %32b Result = %32b Select : 000 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b001;
#10
$display("A = %32b B = %32b Result = %32b Select : 001 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b ",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b010;
#10
$display("A = %32b B = %32b Result = %32b Select : 010 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b011;
#10
$display("A = %32b B = %32b Result = %32b Select : 011 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b ",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b100;
#10
$display("A = %32b B = %32b Result = %32b Select : 100 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b101;
#10
$display("A = %32b B = %32b Result = %32b Select : 101 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b110;
#10
$display("A = %32b B = %32b Result = %32b Select : 110 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

select = 3'b111;
#10
$display("A = %32b B = %32b Result = %32b Select : 111 \nZeroControl:%1b,Overflow:%1b,Carry_Out:%1b",firstinput,secondinput,R,zerocontrol,overflow,carry_out);

end 


endmodule 