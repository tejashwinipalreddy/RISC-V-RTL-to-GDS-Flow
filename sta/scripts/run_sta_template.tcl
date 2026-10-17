# OpenSTA template only. Edit paths to real platform files before use.
# read_liberty /path/to/corner.lib
# read_verilog submission/netlist/rv32i_pipeline_mapped.v
# link_design rv32i_pipeline
# read_sdc physical/constraints/design.sdc
# read_spef submission/reports/design.spef
# report_checks -path_delay max
# report_checks -path_delay min
# report_worst_slack -max
# report_worst_slack -min
# report_tns
# report_clock_skew
