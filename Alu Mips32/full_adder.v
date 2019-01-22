module full_adder(sum,cin_plus_one,cin,a,b);

wire wire1,wire2,wire3,wire4,
     wire5,wire6,wire7;

input a,b,cin;
output sum,cin_plus_one;	  

or   first_step(wire1,a,b);
and  second_step(wire2,a,b);
not  third_step(wire3,wire2);
and  four_step(wire4,wire1,wire3);
and  five_step(wire5,wire4,cin);
or   six_step(wire6,wire4,cin);
not  seven_step(wire7,wire5);

and  sum_step(sum,wire6,wire7);

or next_carry_out(cin_plus_one,wire2,wire5);


endmodule 