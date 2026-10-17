# Physical design: RTL-to-GDSII
This directory documents the intended physical implementation stages. A working run requires a supported platform/PDK, timing libraries, LEF/technology files, RC data, and tool configuration.

## Stages and expected evidence
1. Floorplan: die/core dimensions, utilization, pin placement
2. Power planning: power rings/straps and connectivity checks
3. Placement: placed-cell database and congestion report
4. CTS: clock tree, skew/latency report
5. Global route: congestion estimate and preliminary parasitics
6. Detailed route: routed database and DRC report
7. Extraction: SPEF parasitics
8. Sign-off STA: setup/hold analysis at required corners
9. GDS export: final layout stream file

**No fabricated final GDS or tool results are included.** Add actual outputs from your configured flow under `physical/reports/` and `submission/`.
