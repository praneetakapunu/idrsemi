# Design Decision Guide

## Option 1: PicoRV32 RISC-V Core (Recommended for beginners)
**Pros:**
- Well-documented, proven design
- Lots of examples and community support
- Can run real RISC-V programs
- Good learning experience

**Effort:** Medium
**Resources:** https://github.com/YosysHQ/picorv32

## Option 2: Simple 8-bit Microcontroller
**Pros:**
- Easier to understand and verify
- Smaller area, higher yield chance
- Good first tapeout project
- Can add custom instructions

**Effort:** Low
**Example:** Custom 8-bit CPU with UART, GPIO, timer

## Option 3: Hardware Accelerator
**Ideas:**
- SHA-256 crypto accelerator
- Simple neural network layer
- FFT processor
- Image filter (edge detection)

**Pros:**
- Focused functionality
- Can demonstrate significant speedup
- Good for resume/portfolio

**Effort:** Medium

## Option 4: Mixed-Signal Design
**Ideas:**
- Temperature sensor with ADC
- PWM controller
- Basic audio DAC

**Pros:**
- Unique learning experience
- Combines analog and digital

**Effort:** High (needs analog experience)

## Quick Decision Framework
1. **First chip ever?** → Go with Option 1 or 2
2. **Want to learn fundamentals?** → Option 2
3. **Want real-world application?** → Option 1 or 3
4. **Have specific problem to solve?** → Option 3
5. **Have analog experience?** → Consider Option 4

## Next Steps After Deciding
1. Fill out chip_specification.md
2. Create block diagram
3. Define interfaces (AXI, Wishbone, simple)
4. Start with behavioral RTL model
5. Build testbench infrastructure