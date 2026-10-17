# RTL-to-GDSII flow and outputs
| Step | Input | Typical output | Folder |
|---|---|---|---|
| RTL design | Verilog | elaborated design | `rtl/` |
| Functional simulation | RTL + testbench | log, VCD waveform | `sim/`, `waveforms/` |
| Synthesis | RTL + constraints + libraries | mapped netlist, area/timing reports | `synthesis/` |
| Floorplan | netlist + LEF/technology | floorplan database/image | `physical/reports/` |
| Placement | floorplan + netlist | placed database, congestion report | `physical/reports/` |
| CTS | placed database + clock constraints | clock tree and skew report | `physical/reports/` |
| Routing | CTS database | routed database, DRC report | `physical/reports/` |
| Extraction | routed layout + RC tech | SPEF parasitics | `submission/reports/` |
| Multi-corner STA | netlist + SDC + libraries + SPEF | setup/hold reports for PVT corners | `sta/reports/` |
| GDSII export | routed database + stream map | final GDSII | `submission/gds/` |

Outputs depend on the chosen PDK and toolchain. The repository provides folders and templates, not fabricated outputs.
