module imem(addr, instr);
input logic [31:0] addr;
output logic [31:0] instr;
logic [31:0] mem [0:63];
initial begin
    mem[0] = 32'h00500093; // ADDI x1, x0, 5
    mem[1] = 32'h00700113; // ADDI x2, x0, 7
    mem[2] = 32'h002081B3; // ADD x3, x1, x2
    mem[3] = 32'h00302023; // SW x3, 0(x0)
    mem[4] = 32'h00002203; // LW x4, 0(x0)
    mem[5] = 32'h401102B3; // SUB x5, x2, x1
    mem[6] = 32'h00108463; // BEQ x1, x1, 8
    mem[7] = 32'h06300313; // ADDI x6, x0, 99
    mem[8] = 32'h00900313; // ADDI x6, x0, 9
end
assign instr = mem[addr[7:2]];
endmodule
