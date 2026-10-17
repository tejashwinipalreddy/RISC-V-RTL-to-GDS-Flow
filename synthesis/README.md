# Synthesis stage
Expected outputs from a configured synthesis run:
- mapped Verilog netlist
- cell usage / area report
- timing estimate
- warnings and latch checks

The exact command depends on the selected synthesis tool and target library. `reports/` and `netlist/` are output directories. Do not add invented cell counts or timing numbers; save the tool's real output here.
