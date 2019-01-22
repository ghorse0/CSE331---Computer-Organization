module two_to_one_mux (mux_output,a,b,selector);

input a,b;
input selector;

output mux_output;

wire and_to_or_wire_one;
wire and_to_or_wire_two;
wire selector_not_wire;

not not_select(selector_not_wire , selector);

and selector_one_and (and_to_or_wire_one,a,selector_not_wire);
and selector_two_and (and_to_or_wire_two,b,selector);

or final_output (mux_output ,and_to_or_wire_one,and_to_or_wire_two);

endmodule


