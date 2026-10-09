// 8-Bit Arithmetic Logic Unit module
module alu_8bit (
    input  logic [7:0] A,       // 8-bit input operand A
    input  logic [7:0] B,       // 8-bit input operand B
    input  logic [2:0] opcode,  // 3-bit operation selection code
    output logic [7:0] alu_out, // 8-bit output result
    output logic       zero_flag // Status flag: High if result is exactly 0
);

    always_comb begin
        case(opcode)
            3'b000: alu_out = A + B;       // 0: Addition
            3'b001: alu_out = A - B;       // 1: Subtraction
            3'b010: alu_out = A & B;       // 2: Bitwise AND
            3'b011: alu_out = A | B;       // 3: Bitwise OR
            3'b100: alu_out = A ^ B;       // 4: Bitwise XOR
            3'b101: alu_out = ~A;          // 5: Bitwise NOT
            3'b110: alu_out = A << 1;      // 6: Logical Shift Left
            3'b111: alu_out = A >> 1;      // 7: Logical Shift Right
            default: alu_out = 8'b00000000;
        endcase
        
        // Generate status flags dynamically
        zero_flag = (alu_out == 8'b00000000) ? 1'b1 : 1'b0;
    end

endmodule
