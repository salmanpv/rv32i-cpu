// Testbench for RV32I ALU

`timescale 1ns / 1ps

module tb_alu;

    reg [31:0] a;
    reg [31:0] b;
    reg [3:0] alu_ctrl;
    wire [31:0] result;

    // Instantiate ALU
    alu uut (
        .a(a),
        .b(b),
        .alu_ctrl(alu_ctrl),
        .result(result)
    );

    initial begin
        $display("\n--- ALU Test ---\n");
        $monitor("Time %0t | a=%d, b=%d, ctrl=%b | result=%d (0x%h)", 
                 $time, a, b, alu_ctrl, result, result);

        // ADD
        a = 32'd5; b = 32'd3; alu_ctrl = 4'b0000; #10;

        // SUB
        a = 32'd5; b = 32'd7; alu_ctrl = 4'b0001; #10;

        // AND
        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; alu_ctrl = 4'b0010; #10;

        // OR
        alu_ctrl = 4'b0011; #10;

        // XOR
        alu_ctrl = 4'b0100; #10;

        // SLL
        a = 32'h00000001; b = 32'd4; alu_ctrl = 4'b0101; #10;

        // SRL
        a = 32'h00000010; b = 32'd1; alu_ctrl = 4'b0110; #10;

        // SRA (signed right shift)
        a = -32'sd8; b = 32'd1; alu_ctrl = 4'b0111; #10;

        // SLT (signed)
        a = -5; b = 3; alu_ctrl = 4'b1000; #10;

        // SLTU (unsigned)
        a = -5; b = 3; alu_ctrl = 4'b1001; #10;

        $finish;
    end

endmodule
