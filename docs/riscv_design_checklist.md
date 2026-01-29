# RISC-V Design Checklist

## Core Selection
- [ ] PicoRV32 (small, proven, 32-bit)
- [ ] SERV (ultra-small, bit-serial)
- [ ] Custom minimal core

## Must-Have Features
- [ ] 32-bit RISC-V base integer (RV32I)
- [ ] 4-8KB SRAM
- [ ] UART (115200 baud)
- [ ] 8-16 GPIO pins
- [ ] SPI master (for display)
- [ ] Timer/counter
- [ ] External clock input (10-50MHz)

## Pin Planning (~40 pins total)
- Power: VDD, VSS (2-4 pins)
- Clock: CLK input
- Reset: RST_N
- UART: TX, RX
- SPI: MOSI, MISO, SCK, CS
- GPIO: 8-16 general pins
- Debug: Maybe JTAG (optional)

## Memory Map
```
0x0000_0000 - 0x0000_1FFF : SRAM (8KB)
0x1000_0000 - 0x1000_00FF : GPIO
0x1000_0100 - 0x1000_01FF : UART  
0x1000_0200 - 0x1000_02FF : SPI
0x1000_0300 - 0x1000_03FF : Timer
```

## Software Plan
- [ ] Bootloader in SRAM
- [ ] Simple monitor program
- [ ] LED blink demo
- [ ] "Hello World" UART demo
- [ ] OLED display driver

## Test Board Components (~$50)
- [ ] PCB from JLCPCB/PCBWay
- [ ] USB-UART chip (CP2102)
- [ ] Voltage regulator (3.3V)
- [ ] Crystal oscillator
- [ ] LEDs and buttons
- [ ] 0.96" OLED display
- [ ] Pin headers