# Design and Verification of a 5-Stage Pipelined RISC-V Processor

> **Project status:** RTL starter implementation + flow collateral. Files under `*_example`, `templates`, and `illustrative` are examples/templates only. They are **not tool-generated sign-off results**. Replace them with outputs from your own simulation, synthesis, place-and-route, and STA runs before final submission.

## 1. Project objective
Design and verify an educational 32-bit RISC-V-style pipelined processor and document a complete RTL-to-GDSII implementation flow.

## 2. Repository structure
```text
rtl/                     RTL source
tb/                      SystemVerilog testbench
sim/                     simulation scripts and logs
waveforms/               waveform output location
synthesis/               synthesis scripts, netlists and reports
physical/                floorplan/place/CTS/route scripts and reports
sta/                     multi-corner STA constraints, scripts, report templates
submission/               final GDSII, LEF/DEF and sign-off report locations
docs/                     architecture, verification, flow and results notes
images/                   architecture and RTL-to-GDS flow diagrams
```

## 3. Processor pipeline
- IF: Instruction Fetch
- ID: Instruction Decode / register read
- EX: Execute / ALU
- MEM: Data memory access
- WB: Write back

This is an **educational subset**, not a complete, validated RV32I implementation. Supported instruction intent in the starter RTL: ADD, SUB, AND, OR, ADDI, LW, SW and BEQ. Pipeline hazards, forwarding, full exception handling, and full ISA compliance are not claimed.

## 4. Flow overview
1. RTL coding and lint
2. Functional simulation and waveform inspection
3. Synthesis and area/timing estimation
4. Floorplanning and power planning
5. Placement
6. Clock-tree synthesis (CTS)
7. Global and detailed routing
8. Parasitic extraction
9. Multi-corner static timing analysis (STA)
10. DRC/LVS checks and GDSII export

## 5. STA corner plan
The `sta/corners/` folder documents TT, SS, FF, SF and FS corner scenarios. Actual corners depend on the selected PDK/library and its supported process-voltage-temperature (PVT) models. Use the PDK's real `.lib` files; do not treat the example table as measured timing.

## 6. Run starter simulation
On Linux with Icarus Verilog installed:
```bash
chmod +x sim/run_sim.sh
./sim/run_sim.sh
```
Review the log and VCD in `sim/` or `waveforms/` (depending on script configuration).

## 7. Synthesis and physical design
See `synthesis/README.md` and `physical/README.md`. These flows require a supported toolchain and PDK/platform configuration. A GDS file is only valid for submission after it is produced by the configured implementation flow and its reports are checked.

## 8. Evidence checklist before claiming completion
- [ ] Simulation log shows PASS for planned tests
- [ ] Waveform reviewed
- [ ] Synthesis completed and reports saved
- [ ] Floorplan / placement / CTS / routing completed
- [ ] Real routed database and final GDSII generated
- [ ] STA run at all required PVT corners; setup/hold violations reviewed
- [ ] DRC/LVS results saved if required by course rubric
- [ ] README numbers match the actual reports

## 9. Current status
This repository is a structured project scaffold. Any report with `EXAMPLE`, `TEMPLATE`, or `ILLUSTRATIVE` in its name/content is not a genuine tool result. Replace these before final submission.
