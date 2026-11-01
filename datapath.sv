module datapath(
    input  logic        clk,
    input  logic        reset,
    input  logic        pcsrc,
    input  logic        resultsrc,
    input  logic        alusrc,
    input  logic        regwrite,
    input  logic        memwrite,
    input  logic [1:0]  immsrc,
    input  logic [2:0]  alucontrol,
    output logic        zero,
    output logic [31:0] pc_out,
    output logic [31:0] instr
);
logic [31:0] pcnext;
logic [31:0] pcplus4;
logic [31:0] pctarget;
logic [31:0] rd1;
logic [31:0] rd2;
logic [31:0] immext;
logic [31:0] srcb;
logic [31:0] alu_result;
logic [31:0] readdata;
logic [31:0] result;
// Program Counter
pc pcreg(
    .clk(clk),
    .reset(reset),
    .nextpc(pcnext),
    .pc_out(pc_out)
);
// Instruction Memory
imem imemory(
    .addr(pc_out),
    .instr(instr)
);
// PC + 4
adder pcadder(
    .a(pc_out),
    .b(32'd4),
    .y(pcplus4)
);
// Immediate Generator
extend ext(
    .instr(instr),
    .immsrc(immsrc),
    .immext(immext)
);
// Register File
regfile rf(
    .clk(clk),
    .regwrite(regwrite),
    .ra1(instr[19:15]),
    .ra2(instr[24:20]),
    .wa(instr[11:7]),
    .wd(result),
    .rd1(rd1),
    .rd2(rd2)
);
// ALU Source MUX
mux2 alumux(
    .a(rd2),
    .b(immext),
    .sel(alusrc),
    .y(srcb)
);
// ALU
alu aluunit(
    .srca(rd1),
    .srcb(srcb),
    .alucontrol(alucontrol),
    .result(alu_result),
    .zero(zero)
);
// Data Memory
dmem datamemory(
    .clk(clk),
    .we(memwrite),
    .a(alu_result),
    .wd(rd2),
    .rd(readdata)
);
// Result MUX
mux2 resultmux(
    .a(alu_result),
    .b(readdata),
    .sel(resultsrc),
    .y(result)
);
// Branch Target Address
adder branchadder(
    .a(pc_out),
    .b(immext),
    .y(pctarget)
);
// Next PC MUX
mux2 pcmux(
    .a(pcplus4),
    .b(pctarget),
    .sel(pcsrc),
    .y(pcnext)
);
endmodule
