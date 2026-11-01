module aludec(aluop, funct3, funct7, alucontrol);
input logic [1:0] aluop;
input logic [2:0] funct3;
input logic [6:0] funct7;
output logic [2:0] alucontrol;
always @(*) begin
    case(aluop)
        // Load and Store: ADD
        2'b00: alucontrol = 3'b000;
        // Branch: SUB
        2'b01: alucontrol = 3'b001;
        // R-type and I-type instructions
        2'b10: begin
            case(funct3)
                3'b000: begin
                    if(funct7 == 7'b0100000)
                        alucontrol = 3'b001; // SUB
                    else
                        alucontrol = 3'b000; // ADD
                end
                3'b111: alucontrol = 3'b010; // AND
                3'b110: alucontrol = 3'b011; // OR
                3'b100: alucontrol = 3'b100; // XOR
                3'b010: alucontrol = 3'b101; // SLT
                default: alucontrol = 3'b000;
            endcase
        end
        default: alucontrol = 3'b000;
    endcase
end
endmodule

