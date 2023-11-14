//////////////////////////////////////////////////////////////////////////////////
// Company: MIET
// Engineer: Andrei Solodovnikov
//
// Create Date:
// Design Name:
// Module Name:    tb_riscv_unit
// Project Name:   RISCV_practicum
// Target Devices: Nexys A7-100T
// Tool Versions:
// Description: tb for riscv unit with irq support
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module tb_irq_unit();

    reg clk;
    reg rst;

    riscv_unit unit(
    .clk_i(clk),
    .rst_i(rst)
    );

    initial clk = 0;
    always #10 clk = ~clk;
    initial begin
        $display( "\nStart test: \n\n==========================\nCLICK THE BUTTON 'Run All'\n==========================\n"); $stop();
        unit.irq_req = 0;
        rst = 1;
        #20;
        rst = 0;
        repeat(20)@(posedge clk);
        unit.irq_req = 1;
        while(unit.irq_ret == 0) begin
          @(posedge clk);
        end
        unit.irq_req = 0;
        repeat(20)@(posedge clk);
        $display("\n The test is over \n See the internal signals of the module on the waveform \n");
        $finish;
    end

endmodule
