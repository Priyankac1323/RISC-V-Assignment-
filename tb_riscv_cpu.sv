module tb_riscv_cpu;
logic clk;
logic reset;
logic [31:0] pc_out;
logic [31:0] instr;
// Instantiate RISC-V CPU
riscv dut(
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out),
    .instr(instr)
);
// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
// Test sequence
initial begin
    $display("Starting RISC-V CPU Simulation");
    reset = 1;
    #20;
    reset = 0;
    $monitor("Time=%0t | PC=%h | Instruction=%h",
             $time, pc_out, instr);
    #200;
    $display("RISC-V CPU Simulation Completed");
    $finish;
end
endmodule
