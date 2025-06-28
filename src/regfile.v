// Step 2: RV32I Register File Design (regfile.v)

/*
 * RV32I has 32 registers (x0 - x31), each 32 bits wide.
 * Register x0 is hardwired to zero and cannot be modified.
 * Read: 2 read ports
 * Write: 1 write port (with enable)
 */

module regfile (
    input wire clk,
    input wire we,                      // write enable
    input wire [4:0] rs1_addr,          // read port 1 address
    input wire [4:0] rs2_addr,          // read port 2 address
    input wire [4:0] rd_addr,           // write address
    input wire [31:0] rd_data,          // data to write
    output wire [31:0] rs1_data,        // read port 1 data
    output wire [31:0] rs2_data         // read port 2 data
);

    // 32 registers, each 32 bits wide
    reg [31:0] regs[31:0];

    // Read ports
    assign rs1_data = (rs1_addr == 0) ? 32'b0 : regs[rs1_addr];
    assign rs2_data = (rs2_addr == 0) ? 32'b0 : regs[rs2_addr];

    // Write port
    always @(posedge clk) begin
        if (we && rd_addr != 0) begin
            regs[rd_addr] <= rd_data;
        end
    end

endmodule
