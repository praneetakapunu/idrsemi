#!/bin/bash

# IDRSEMI Setup Script
# Sets up the open source chip design environment

set -e

echo "Setting up IDRSEMI open source chip design environment..."

# Check if running on Ubuntu/Debian
if ! command -v apt &> /dev/null; then
    echo "This script is designed for Ubuntu/Debian systems"
    echo "Please install tools manually on other systems"
    exit 1
fi

echo "Installing basic dependencies..."
sudo apt update
sudo apt install -y git build-essential python3 python3-pip \
    tcl-dev tk-dev libffi-dev git mercurial cmake \
    libboost-system-dev libboost-python-dev libboost-all-dev \
    zlib1g-dev libbz2-dev

echo "Installing Yosys..."
if ! command -v yosys &> /dev/null; then
    sudo apt install -y yosys
fi

echo "Installing Verilator..."
if ! command -v verilator &> /dev/null; then
    sudo apt install -y verilator
fi

echo "Installing Icarus Verilog..."
if ! command -v iverilog &> /dev/null; then
    sudo apt install -y iverilog
fi

echo "Installing GTKWave..."
if ! command -v gtkwave &> /dev/null; then
    sudo apt install -y gtkwave
fi

echo "Installing Python verification tools..."
pip3 install --user cocotb pytest

echo "Setting up OpenROAD..."
echo "OpenROAD requires manual installation from: https://openroad.readthedocs.io/"
echo "Or use Docker: docker pull openroad/openroad"

echo "Setting up SkyWater PDK..."
echo "Clone PDK from: https://github.com/google/skywater-pdk"
echo "Follow setup instructions in their README"

echo "Basic setup complete!"
echo "Next steps:"
echo "1. Install OpenROAD"
echo "2. Set up SkyWater 130nm PDK"
echo "3. Run first RTL synthesis test"