module pc(clk, reset, nextpc, pc_out);
input logic clk, reset;
input logic [31:0] nextpc;
output logic [31:0] pc_out;
always @(posedge clk)
begin
    if(reset)
        pc_out <= 32'b0;
    else
        pc_out <= nextpc;
end
endmodule
