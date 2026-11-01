module dmem(
    input  logic        clk,
    input  logic        we,
    input  logic [31:0] a,
    input  logic [31:0] wd,
    output logic [31:0] rd
);
logic [31:0] RAM [63:0];
// Read data
assign rd = RAM[a[7:2]];
// Write data
always_ff @(posedge clk) begin
    if (we)
        RAM[a[7:2]] <= wd;
end
endmodule

