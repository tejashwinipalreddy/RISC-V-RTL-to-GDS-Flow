#!/usr/bin/env bash
set -euo pipefail
mkdir -p waveforms
iverilog -g2012 -o sim/simv rtl/rv32i_pipeline.v tb/riscv_tb.sv
vvp sim/simv | tee sim/simulation.log
