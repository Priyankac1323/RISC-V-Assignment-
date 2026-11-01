module pc_tb();
reg clk, reset;
reg [31:0] nextpc;
wire [31:0] pc_out;
pc DUT(clk, reset, nextpc, pc_out);
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial
begin
    reset = 1;
    nextpc = 32'd0;
    #10 reset = 0;
    nextpc = 32'd4;
    #10 nextpc = 32'd8;
    #10 nextpc = 32'd12;
    #10 nextpc = 32'd16;
    #10 reset = 1;
    #10 $finish;
end
endmodule
