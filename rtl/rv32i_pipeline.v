// Educational 5-stage pipelined processor starter.
// This is a compact teaching example, not a complete RV32I implementation.
module rv32i_pipeline (
    input  wire clk,
    input  wire rst
);
    reg [31:0] pc;
    reg [31:0] imem [0:63];
    reg [31:0] dmem [0:63];
    reg [31:0] regs [0:31];

    reg [31:0] if_id_instr, if_id_pc;
    reg [31:0] id_ex_instr, id_ex_pc, id_ex_a, id_ex_b, id_ex_imm;
    reg [4:0]  id_ex_rd;
    reg [31:0] ex_mem_alu, ex_mem_b;
    reg [4:0]  ex_mem_rd;
    reg        ex_mem_memread, ex_mem_memwrite, ex_mem_regwrite;
    reg [31:0] mem_wb_data;
    reg [4:0]  mem_wb_rd;
    reg        mem_wb_regwrite;

    integer i;
    wire [6:0] opcode = id_ex_instr[6:0];
    wire [2:0] funct3 = id_ex_instr[14:12];
    wire [6:0] funct7 = id_ex_instr[31:25];
    reg [31:0] alu_result;
    wire [31:0] load_data = dmem[ex_mem_alu[7:2]];

    initial begin
        pc = 0;
        for (i=0; i<32; i=i+1) regs[i] = 0;
        for (i=0; i<64; i=i+1) begin imem[i]=32'h00000013; dmem[i]=0; end
    end

    always @* begin
        case (opcode)
          7'b0110011: begin
            case ({funct7,funct3})
              {7'b0000000,3'b000}: alu_result = id_ex_a + id_ex_b;
              {7'b0100000,3'b000}: alu_result = id_ex_a - id_ex_b;
              {7'b0000000,3'b111}: alu_result = id_ex_a & id_ex_b;
              {7'b0000000,3'b110}: alu_result = id_ex_a | id_ex_b;
              default: alu_result = 0;
            endcase
          end
          7'b0010011: alu_result = id_ex_a + id_ex_imm;
          7'b0000011, 7'b0100011: alu_result = id_ex_a + id_ex_imm;
          default: alu_result = 0;
        endcase
    end

    always @(posedge clk) begin
      if (rst) begin
        pc <= 0;
        if_id_instr <= 32'h00000013; if_id_pc <= 0;
        id_ex_instr <= 32'h00000013; id_ex_pc <= 0;
        ex_mem_alu <= 0; ex_mem_b <= 0; ex_mem_rd <= 0;
        ex_mem_memread <= 0; ex_mem_memwrite <= 0; ex_mem_regwrite <= 0;
        mem_wb_data <= 0; mem_wb_rd <= 0; mem_wb_regwrite <= 0;
      end else begin
        // IF
        if_id_instr <= imem[pc[7:2]];
        if_id_pc <= pc;
        pc <= pc + 4;

        // ID (simple register reads; no hazard forwarding in this starter)
        id_ex_instr <= if_id_instr;
        id_ex_pc <= if_id_pc;
        id_ex_a <= regs[if_id_instr[19:15]];
        id_ex_b <= regs[if_id_instr[24:20]];
        id_ex_imm <= {{20{if_id_instr[31]}}, if_id_instr[31:20]};
        id_ex_rd <= if_id_instr[11:7];

        // EX/MEM control decode
        ex_mem_alu <= alu_result;
        ex_mem_b <= id_ex_b;
        ex_mem_rd <= id_ex_rd;
        ex_mem_memread <= (opcode == 7'b0000011);
        ex_mem_memwrite <= (opcode == 7'b0100011);
        ex_mem_regwrite <= (opcode == 7'b0110011 || opcode == 7'b0010011 || opcode == 7'b0000011);

        // MEM
        if (ex_mem_memwrite) dmem[ex_mem_alu[7:2]] <= ex_mem_b;
        mem_wb_data <= ex_mem_memread ? load_data : ex_mem_alu;
        mem_wb_rd <= ex_mem_rd;
        mem_wb_regwrite <= ex_mem_regwrite;

        // WB
        if (mem_wb_regwrite && mem_wb_rd != 0) regs[mem_wb_rd] <= mem_wb_data;
        regs[0] <= 0;
      end
    end
endmodule
