// Demo program for Praneet's RISC-V chip
// This will run on YOUR silicon!

#include <stdint.h>

// Memory-mapped peripherals
#define GPIO_BASE    0x10000000
#define UART_BASE    0x10000100
#define TIMER_BASE   0x10000300

#define GPIO_OUT     (*(volatile uint32_t*)(GPIO_BASE + 0))
#define UART_DATA    (*(volatile uint32_t*)(UART_BASE + 0))
#define UART_STATUS  (*(volatile uint32_t*)(UART_BASE + 4))

void uart_puts(const char *s) {
    while (*s) {
        while (UART_STATUS & 0x01); // Wait for ready
        UART_DATA = *s++;
    }
}

void delay_ms(int ms) {
    // Simple delay loop (tune for your clock speed)
    for (int i = 0; i < ms * 1000; i++) {
        asm volatile("nop");
    }
}

void led_pattern() {
    // Knight Rider style LED sweep
    for (int i = 0; i < 8; i++) {
        GPIO_OUT = (1 << i);
        delay_ms(100);
    }
    for (int i = 6; i >= 1; i--) {
        GPIO_OUT = (1 << i);
        delay_ms(100);
    }
}

int main() {
    uart_puts("\r\n=== Praneet's RISC-V Processor ===\r\n");
    uart_puts("Designed and taped out in 2026!\r\n");
    uart_puts("Running on real silicon at SkyWater 130nm\r\n\r\n");
    
    uart_puts("Commands:\r\n");
    uart_puts("  1 - LED light show\r\n");
    uart_puts("  2 - Display message\r\n");
    uart_puts("  3 - System info\r\n\r\n");
    
    while (1) {
        uart_puts("PraneetCPU> ");
        
        // Simple command loop
        char cmd = uart_getc();
        uart_putc(cmd); // Echo
        uart_puts("\r\n");
        
        switch(cmd) {
            case '1':
                uart_puts("Starting LED show...\r\n");
                for (int i = 0; i < 5; i++) {
                    led_pattern();
                }
                GPIO_OUT = 0;
                break;
                
            case '2':
                uart_puts("Hello from Praneet's CPU!\r\n");
                uart_puts("This message is brought to you by\r\n");
                uart_puts("32,000+ transistors working together!\r\n");
                break;
                
            case '3':
                uart_puts("PraneetV1 RISC-V SoC\r\n");
                uart_puts("- RV32I instruction set\r\n");
                uart_puts("- 8KB SRAM\r\n");
                uart_puts("- UART, SPI, GPIO peripherals\r\n");
                uart_puts("- Running at 10MHz\r\n");
                break;
        }
    }
    
    return 0;
}