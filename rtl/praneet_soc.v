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
