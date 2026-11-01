module flopr_tb();
reg clk, reset;
reg [31:0] d;
wire [31:0] q;
flopr DUT(clk, reset, d, q);
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial
begin
    reset = 1;
    d = 32'd0;
    #10 reset = 0;
    d = 32'd4;
    #10 d = 32'd8;
    #10 d = 32'd12;
    #10 reset = 1;
    #10 reset = 0;
    d = 32'd16;
    #10 $finish;
end
  endmodule
