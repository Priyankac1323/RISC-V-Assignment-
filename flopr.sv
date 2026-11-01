module flopr(clk, reset, d, q);
input logic clk, reset;
input logic [31:0] d;
output logic [31:0] q;
always @(posedge clk)
begin
    if (reset)
        q <= 32'b0;
    else
        q <= d;
end
endmodule
