module imem_tb();
reg [31:0] addr;
wire [31:0] instr;
imem DUT(addr, instr);
initial begin
    addr = 32'd0;
    #10 addr = 32'd4;
    #10 addr = 32'd8;
    #10 addr = 32'd12;
    #10 addr = 32'd16;
    #10 addr = 32'd20;
    #10 addr = 32'd24;
    #10 addr = 32'd28;
    #10 addr = 32'd32;
    #10 $finish;
end
endmodule
