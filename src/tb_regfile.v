// Testbench for RV32I Register File

`timescale 1ns / 1ps

module tb_regfile;

    reg clk;
    reg we;
    reg [4:0] rs1_addr;
    reg [4:0] rs2_addr;
    reg [4:0] rd_addr;
    reg [31:0] rd_data;
    wire [31:0] rs1_data;
    wire [31:0] rs2_data;

    // Instantiate the register file
    regfile uut (
        .clk(clk),
        .we(we),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .rd_data(rd_data),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

    // Clock generation
    always #5 clk = ~clk; // 100MHz clock

    initial begin
        $display("\n--- Register File Test ---\n");
        $monitor("Time %0t | we=%b | rd=%d, data=%h | rs1=%d->%h | rs2=%d->%h", 
                  $time, we, rd_addr, rd_data, rs1_addr, rs1_data, rs2_addr, rs2_data);

        clk = 0;
        we = 0;
        rd_addr = 0;
        rd_data = 0;
        rs1_addr = 0;
        rs2_addr = 0;

        // Wait one cycle
        #10;

        // Write 0xAAAA_BBBB to x5
        we = 1; rd_addr = 5; rd_data = 32'hAAAA_BBBB; #10;

        // Write 0x1234_5678 to x10
        we = 1; rd_addr = 10; rd_data = 32'h1234_5678; #10;

        // Attempt to write to x0 (should not change)
        we = 1; rd_addr = 0; rd_data = 32'hFFFF_FFFF; #10;

        // Read back from x5 and x10
        we = 0; rs1_addr = 5; rs2_addr = 10; #10;

        // Read from x0
        rs1_addr = 0; rs2_addr = 0; #10;

        $finish;
    end

endmodule
