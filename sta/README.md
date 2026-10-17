# Multi-corner Static Timing Analysis (STA)
STA checks setup and hold timing without applying simulation vectors. Multi-corner analysis checks timing under several process-voltage-temperature (PVT) conditions.

## Typical corner labels
- **TT**: typical process, nominal voltage, nominal temperature
- **SS**: slow NMOS / slow PMOS process corner
- **FF**: fast NMOS / fast PMOS process corner
- **SF / FS**: mixed slow/fast device corners, where supported by the PDK

These labels are shorthand only. Actual voltage, temperature and library filenames must match the selected PDK. Not every platform provides all five corners.

## Expected outputs per corner
- setup WNS/TNS
- hold WNS/TNS
- number of violating endpoints
- worst setup/hold path report
- clock skew/latency
- library and RC corner used

The CSV under `corners/` is a planning template, not measured timing data. Replace with real OpenSTA/Cadence STA results.
