module regfile(clk, we3, a1, a2, a3, wd3, rd1, rd2);
input logic clk, we3;
input logic [4:0] a1, a2, a3;
input logic [31:0] wd3;
output logic [31:0] rd1, rd2;
logic [31:0] rf [31:0];
integer i;
initial begin
    for(i = 0; i < 32; i = i + 1)
        rf[i] = 32'b0;
end
always @(posedge clk) begin
    if(we3 && a3 != 5'b00000)
        rf[a3] <= wd3;
end
assign rd1 = (a1 == 5'b00000) ? 32'b0 : rf[a1];
assign rd2 = (a2 == 5'b00000) ? 32'b0 : rf[a2];
endmodule
