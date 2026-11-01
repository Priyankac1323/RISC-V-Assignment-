module riscv(
    input  logic        clk,
    input  logic        reset,

    output logic [31:0] pc_out,
    output logic [31:0] instr
);

logic pcsrc;
logic regwrite;
logic memwrite;
logic alusrc;
logic resultsrc;

logic [1:0] immsrc;
logic [2:0] alucontrol;

logic zero;

// Controller
controller ctrl(
    .op(instr[6:0]),
    .funct3(instr[14:12]),
    .funct7b5(instr[30]),
    .zero(zero),

    .pcsrc(pcsrc),
    .regwrite(regwrite),
    .memwrite(memwrite),
    .alusrc(alusrc),
    .resultsrc(resultsrc),
    .immsrc(immsrc),
    .alucontrol(alucontrol)
);

// Datapath
datapath dp(
    .clk(clk),
    .reset(reset),

    .pcsrc(pcsrc),
    .resultsrc(resultsrc),
    .alusrc(alusrc),
    .regwrite(regwrite),
    .memwrite(memwrite),

    .immsrc(immsrc),
    .alucontrol(alucontrol),

    .zero(zero),
    .pc_out(pc_out),
    .instr(instr)
);

endmodule
