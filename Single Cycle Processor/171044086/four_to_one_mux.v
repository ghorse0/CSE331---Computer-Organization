module four_to_one_mux(mux_output,a,b,c,d,selector_one,selector_two);
input a, b, c, d ;
input selector_one , selector_two ;
output mux_output ; 

wire and_to_or_wire_one;
wire and_to_or_wire_two;
wire and_to_or_wire_three;
wire and_to_or_wire_four;
wire selector_one_not_wire;
wire selector_two_not_wire;

not not_selectone (selector_one_not_wire , selector_one);
not not_selecttwo (selector_two_not_wire , selector_two);

and selector_one_and (and_to_or_wire_one,a,selector_one_not_wire , selector_two_not_wire);
and selector_two_and (and_to_or_wire_two,b,selector_one,selector_two_not_wire);
and selector_three_and (and_to_or_wire_three,c,selector_one_not_wire,selector_two);
and selector_four_and (and_to_or_wire_four,d,selector_one,selector_two);

or final_output (mux_output, and_to_or_wire_one, and_to_or_wire_two
						,and_to_or_wire_three,and_to_or_wire_four);

endmodule 