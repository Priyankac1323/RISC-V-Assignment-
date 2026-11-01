module maindec(op, regwrite, immsrc, alusrc, memwrite,
               resultsrc, branch, jump, aluop);
input logic [6:0] op;
output logic regwrite, alusrc, memwrite, branch, jump;
output logic [1:0] immsrc, resultsrc, aluop;
always @(*) begin
    // Default values
    regwrite = 0;
    immsrc = 2'b00;
    alusrc = 0;
    memwrite = 0;
    resultsrc = 2'b00;
    branch = 0;
    jump = 0;
    aluop = 2'b00;
    case(op)
        // R-type instructions
        7'b0110011: begin
            regwrite = 1;
            alusrc = 0;
            resultsrc = 2'b00;
            aluop = 2'b10;
        end
        // I-type: ADDI
        7'b0010011: begin
            regwrite = 1;
            alusrc = 1;
            immsrc = 2'b00;
            resultsrc = 2'b00;
            aluop = 2'b10;
        end
        // Load: LW
        7'b0000011: begin
            regwrite = 1;
            alusrc = 1;
            immsrc = 2'b00;
            resultsrc = 2'b01;
            aluop = 2'b00;
        end
        // Store: SW
        7'b0100011: begin
            alusrc = 1;
            immsrc = 2'b01;
            memwrite = 1;
            aluop = 2'b00;
        end
        // Branch: BEQ
        7'b1100011: begin
            immsrc = 2'b10;
            branch = 1;
            aluop = 2'b01;
        end
        // Jump: JAL
        7'b1101111: begin
            regwrite = 1;
            immsrc = 2'b11;
            resultsrc = 2'b10;
            jump = 1;
        end
        default: begin
        end
    endcase
end
endmodule
