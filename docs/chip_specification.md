# IDRSEMI Chip Specification

## Chip Overview
**Name:** PraneetV1 (or choose your name!)
**Purpose:** Educational RISC-V microcontroller with demo peripherals
**Target:** SkyWater 130nm
**Area Budget:** ~10mm² (for free shuttle)

## Architecture
- [x] Core type: RISC-V (RV32I) - PicoRV32 based
- [x] Bit width: 32-bit
- [x] Memory: 8KB SRAM
- [x] I/O: UART, SPI, 16 GPIO pins
- [x] Special features: Hardware timer, LED PWM controller

## Performance Targets
- Clock frequency: [Target MHz]
- Power consumption: [Target mW]
- Key operations/sec: [If applicable]

## Pin Planning
- Power pins: VDD, VSS
- Clock input
- Reset
- Data I/O: [List main interfaces]

## Verification Strategy
- [ ] Unit tests for each module
- [ ] System-level tests
- [ ] Corner case coverage

## Timeline
- Week 2: Architecture complete
- Week 3-4: RTL implementation
- Week 5-6: Verification
- Week 7-8: Physical design
- Week 9-10: Tapeout prep