# Open Source Chip Design Tools and Flow

## Essential Open Source Tools

### 1. RTL Design and Simulation
- **Verilator**: Fast Verilog simulator, good for large designs
- **Icarus Verilog**: Full-featured Verilog simulator
- **GHDL**: VHDL simulator
- **GTKWave**: Waveform viewer for debugging
- **Yosys**: Synthesis tool (Verilog to netlist)

### 2. Formal Verification
- **sby**: Formal verification suite for Yosys
- **Symbiyosys**: Formal verification framework
- **CBMC**: Bounded model checker

### 3. Physical Design
- **OpenROAD**: Complete RTL-to-GDSII flow
  - **OpenSTA**: Static timing analysis
  - **TritonRoute**: Detailed routing
  - **RePlAce**: Global placement
  - **OpenDP**: Detailed placement
- **Magic**: VLSI layout editor and DRC checker
- **Netgen**: LVS (Layout vs Schematic) checker
- **KLayout**: Layout viewer and editor

### 4. Process Design Kits (PDKs)
- **SkyWater 130nm PDK**: Free, open-source PDK by Google/SkyWater
- **GlobalFoundries 180nm**: Available through some programs
- **IHP 130nm**: Research-oriented PDK

### 5. Standard Cell Libraries
- **sky130_fd_sc_hd**: High-density standard cells for SkyWater 130nm
- **OpenRAM**: Memory compiler

### 6. Verification and Testing
- **cocotb**: Python-based verification framework
- **UVM**: Universal Verification Methodology (SystemVerilog)
- **RISC-V DV**: RISC-V processor verification framework

## Complete Design Flow

### Phase 1: Architecture and Specification (Weeks 1-2)
1. Define chip functionality and specifications
2. Create high-level architecture
3. Define interfaces and protocols
4. Create verification plan

### Phase 2: RTL Design (Weeks 3-8)
1. Write Verilog/SystemVerilog RTL code
2. Create testbenches using cocotb or SystemVerilog
3. Functional simulation with Verilator/Icarus
4. Code coverage analysis
5. Formal verification with sby

### Phase 3: Synthesis (Week 9)
1. Logic synthesis with Yosys
2. Technology mapping to target PDK
3. Timing analysis with OpenSTA
4. Area and power estimation

### Phase 4: Physical Design (Weeks 10-14)
1. Floorplanning
2. Power planning
3. Placement (global and detailed)
4. Clock tree synthesis
5. Routing (global and detailed)
6. Static timing analysis
7. Design rule checking (DRC)
8. Layout vs Schematic (LVS) verification

### Phase 5: Verification and Sign-off (Weeks 15-16)
1. Post-layout simulation
2. Final timing analysis
3. Power analysis
4. Signal integrity analysis
5. Generate GDSII files

### Phase 6: Tapeout Preparation (Week 17)
1. Final design checks
2. Submit to foundry (SkyWater shuttle program, etc.)
3. Generate test patterns
4. Create test plan for fabricated chips

## Manufacturing Options

### Open Source Foundry Programs
1. **Google/SkyWater Shuttle Program**: Free tapeout for open designs
2. **ChipIgnite**: Efabless shuttle program
3. **TinyTapeout**: Educational multi-project wafer runs

### Minimum Design Complexity
- Start with simple designs (counters, basic processors)
- RISC-V core implementation is popular choice
- Focus on functionality over performance initially

## Recommended Project Structure
```
idrsemi/
├── rtl/           # RTL source code
├── tb/            # Testbenches
├── syn/           # Synthesis scripts and results  
├── pnr/           # Place and route files
├── verify/        # Verification environment
├── docs/          # Documentation
├── scripts/       # Build and automation scripts
└── results/       # Generated files and reports
```

## Getting Started Steps
1. Install OpenROAD and Yosys toolchain
2. Set up SkyWater 130nm PDK
3. Create simple RTL design (e.g., basic CPU)
4. Set up continuous integration for verification
5. Begin physical design flow