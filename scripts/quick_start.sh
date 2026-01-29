#!/bin/bash
# Quick start script for RISC-V implementation

echo "=== IDRSEMI RISC-V Quick Start ==="
echo

echo "1. Testing tool installation..."
which yosys > /dev/null && echo "✓ Yosys installed" || echo "✗ Yosys missing"
which iverilog > /dev/null && echo "✓ Icarus Verilog installed" || echo "✗ Icarus missing"  
which verilator > /dev/null && echo "✓ Verilator installed" || echo "✗ Verilator missing"
which gtkwave > /dev/null && echo "✓ GTKWave installed" || echo "✗ GTKWave missing"

echo
echo "2. Creating RISC-V wrapper..."
cat > rtl/praneet_soc.v << 'EOF'
// PraneetV1 - Simple RISC-V SoC
module praneet_soc (
    input  clk,
    input  resetn,
    
    // UART
    output uart_tx,
    input  uart_rx,
    
    // GPIO
    output [7:0] gpio_out,
    input  [7:0] gpio_in,
    
    // SPI
    output spi_mosi,
    input  spi_miso,
    output spi_sck,
    output spi_cs,
    
    // Debug LED
    output heartbeat_led
);

// Heartbeat counter
reg [23:0] counter;
always @(posedge clk) begin
    if (!resetn)
        counter <= 0;
    else
        counter <= counter + 1;
end

assign heartbeat_led = counter[23]; // Blink ~6Hz at 100MHz

// TODO: Instantiate PicoRV32 here
// TODO: Add UART peripheral
// TODO: Add GPIO peripheral  
// TODO: Add memory

endmodule
EOF

echo
echo "3. Next steps:"
echo "   - Study picorv32/picorv32.v"
echo "   - Create memory module (SRAM)"
echo "   - Add UART peripheral"
echo "   - Write testbench"
echo "   - Create demo program"

echo
echo "4. Useful commands:"
echo "   make synth     # Run synthesis"
echo "   make sim       # Run simulation"
echo "   make prog      # Build demo program"