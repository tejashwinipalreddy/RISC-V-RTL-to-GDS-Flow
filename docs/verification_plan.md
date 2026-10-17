# Verification plan
| Test | Goal | Expected evidence |
|---|---|---|
| Reset | registers/PC initialize predictably | simulator log + waveform |
| ADD/SUB | arithmetic result correctness | self-checking assertions |
| AND/OR | bitwise operation correctness | self-checking assertions |
| ADDI | immediate arithmetic | self-checking assertions |
| LW/SW | data memory behavior | self-checking assertions |
| BEQ | branch behavior | tests after branch implementation |
| Back-to-back dependencies | expose data hazards | tests and waveform |
| Reset during activity | reset response | testbench result |

Current testbench is only a smoke test. Mark each test complete only after implementing and running it.
