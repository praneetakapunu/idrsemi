# 🚀 Your RISC-V Journey Starts Here!

## You've Made Great Decisions:
1. ✅ Chose RISC-V (smart move - no licensing fees!)
2. ✅ Tools are installed and ready
3. ✅ PicoRV32 core is downloaded
4. ✅ Basic SoC structure created

## Your Chip Will Have:
- **32-bit RISC-V processor** (runs real programs!)
- **8KB RAM** (enough for demos)
- **UART** (talk to computer)
- **GPIO** (blink LEDs, read buttons)
- **SPI** (drive OLED displays)

## What Your Family Will See:
1. Physical chip in a small package
2. LED patterns they can control
3. Messages on an OLED display
4. Interactive terminal on computer
5. YOU explaining how you designed it!

## Next 3 Steps (Do Now):

### 1. Test PicoRV32 Synthesis (2 min)
```bash
cd /home/exedev/clawd/idrsemi
make test-picorv32
```
This shows how many transistors the CPU uses.

### 2. Look at Example Code (5 min)
```bash
# See the simple demo program:
cat firmware/hello_family.c

# See the CPU core:
head -50 picorv32/picorv32.v

# See your SoC wrapper:
cat rtl/praneet_soc.v
```

### 3. Choose Your Chip Name (Important!)
Edit `docs/chip_specification.md` and pick a name:
- PraneetV1
- YourNameHere
- Something meaningful to you

## This Week's Goals:
1. Connect PicoRV32 to memory
2. Add UART peripheral  
3. Get "Hello World" in simulation
4. Create pin assignment

## Resources:
- PicoRV32 docs: picorv32/README.md
- Example SoC: picorv32/picosoc/
- SkyWater PDK: Will set up next

## Remember:
- This is YOUR chip design
- Every decision is yours
- Ask questions when stuck
- Have fun with it!

**Ready? Let's build a processor! 🎯**