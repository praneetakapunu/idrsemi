# IDRSEMI Makefile
# Open source chip design build system

# Tool paths
VERILATOR = verilator
IVERILOG = iverilog
YOSYS = yosys
GTKWAVE = gtkwave

# Directories
RTL_DIR = rtl
TB_DIR = tb
SYN_DIR = syn
RESULTS_DIR = results

# Default target
.PHONY: all
all: lint sim syn

# Lint RTL with Verilator
.PHONY: lint
lint:
	@echo "Running lint check..."
	mkdir -p $(RESULTS_DIR)
	$(VERILATOR) --lint-only -Wall $(RTL_DIR)/*.sv

# Simulate with Icarus Verilog
.PHONY: sim
sim:
	@echo "Running simulation..."
	mkdir -p $(RESULTS_DIR)
	cd $(RESULTS_DIR) && $(IVERILOG) -g2012 -o counter_tb ../$(TB_DIR)/counter_tb.sv ../$(RTL_DIR)/counter.sv
	cd $(RESULTS_DIR) && ./counter_tb
	@echo "Simulation complete. Waveform: $(RESULTS_DIR)/counter_tb.vcd"

# View waveforms
.PHONY: wave
wave: sim
	cd $(RESULTS_DIR) && $(GTKWAVE) counter_tb.vcd &

# Synthesis with Yosys
.PHONY: syn
syn:
	@echo "Running synthesis..."
	mkdir -p $(SYN_DIR) $(RESULTS_DIR)
	echo "read_verilog $(RTL_DIR)/counter.sv" > $(SYN_DIR)/synth.ys
	echo "hierarchy -top counter" >> $(SYN_DIR)/synth.ys
	echo "proc; opt; fsm; opt; memory; opt" >> $(SYN_DIR)/synth.ys
	echo "techmap; opt" >> $(SYN_DIR)/synth.ys
	echo "dfflibmap -liberty /usr/share/yosys/cmos.lib || echo 'Warning: No standard cell library'" >> $(SYN_DIR)/synth.ys
	echo "abc -liberty /usr/share/yosys/cmos.lib || abc" >> $(SYN_DIR)/synth.ys
	echo "opt; clean" >> $(SYN_DIR)/synth.ys
	echo "stat" >> $(SYN_DIR)/synth.ys
	echo "write_verilog $(RESULTS_DIR)/counter_syn.v" >> $(SYN_DIR)/synth.ys
	$(YOSYS) -s $(SYN_DIR)/synth.ys

# Clean generated files
.PHONY: clean
clean:
	rm -rf $(RESULTS_DIR) $(SYN_DIR)/synth.ys

# Help
.PHONY: help
help:
	@echo "IDRSEMI Build Targets:"
	@echo "  all     - Run lint, simulation, and synthesis"
	@echo "  lint    - Lint RTL code with Verilator"
	@echo "  sim     - Run simulation with Icarus Verilog"
	@echo "  wave    - View waveforms with GTKWave"
	@echo "  syn     - Run synthesis with Yosys"
	@echo "  clean   - Clean generated files"
	@echo "  help    - Show this help"