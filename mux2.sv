module mux2(a, b, sel, y);
input logic [31:0] a, b;
input logic sel;
output logic [31:0] y;
assign y = sel ? b : a;
endmodule
