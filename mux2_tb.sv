module mux2_tb();
reg [31:0] a, b;
reg sel;
wire [31:0] y;
mux2 DUT(a, b, sel, y);
initial
begin
    a = 32'd10;
    b = 32'd20;
    sel = 0;
    #10 sel = 1;
    #10 a = 32'd30;
    b = 32'd40;
    sel = 0;
    #10 sel = 1;
    #10 $finish;
end
endmodule
