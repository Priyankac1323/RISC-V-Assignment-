module adder_tb();
reg [31:0] a, b;
wire [31:0] y;
adder DUT(a, b, y);
initial
begin
    a = 32'd0;
    b = 32'd4;
    #10 a = 32'd4;
    b = 32'd4;
    #10 a = 32'd8;
    b = 32'd4;
    #10 a = 32'd12;
    b = 32'd4;
    #10 $finish;
end
endmodule
