module controller(
    input  logic [6:0] op,
    input  logic [2:0] funct3,
    input  logic       funct7b5,
    input  logic       zero,

    output logic       pcsrc,
    output logic       regwrite,
    output logic       memwrite,
    output logic       alusrc,
    output logic       resultsrc,
    output logic [1:0] immsrc,
    output logic [2:0] alucontrol
);
logic branch;
logic jump;
logic [1:0] aluop;
maindec md(
    .op(op),
    .regwrite(regwrite),
    .alusrc(alusrc),
    .memwrite(memwrite),
    .resultsrc(resultsrc),
    .branch(branch),
    .jump(jump),
    .immsrc(immsrc),
    .aluop(aluop)
);
aludec ad(
    .aluop(aluop),
    .funct3(funct3),
    .funct7b5(funct7b5),
    .alucontrol(alucontrol)
);
// Branch decision
assign pcsrc = (branch & zero) | jump;
endmodule

