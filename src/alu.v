// Step 3: RV32I ALU Design (alu.v)

/*
 * ALU for basic RV32I operations
 * Supported operations:
 * - ADD, SUB
 * - AND, OR, XOR
 * - SLL (shift left logical)
 * - SRL (shift right logical)
 * - SRA (shift right arithmetic)
 * - SLT, SLTU (set less than signed/unsigned)
 */

module alu (
    input wire [31:0] a,       // operand A
    input wire [31:0] b,       // operand B
    input wire [3:0] alu_ctrl, // operation selector
    output reg [31:0] result
);

    always @(*) begin
        case (alu_ctrl)
            4'b0000: result = a + b;                  // ADD
            4'b0001: result = a - b;                  // SUB
            4'b0010: result = a & b;                  // AND
            4'b0011: result = a | b;                  // OR
            4'b0100: result = a ^ b;                  // XOR
            4'b0101: result = a << b[4:0];            // SLL
            4'b0110: result = a >> b[4:0];            // SRL
            4'b0111: result = $signed(a) >>> b[4:0];  // SRA
            4'b1000: result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0; // SLT
            4'b1001: result = (a < b) ? 32'd1 : 32'd0;                    // SLTU
            default: result = 32'd0;                  // Default to 0
        endcase
    end

endmodule
