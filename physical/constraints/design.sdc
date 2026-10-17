# Starter SDC template — confirm clocks and I/O delays for your actual design.
create_clock -name core_clk -period 10.000 [get_ports clk]
set_input_delay  1.000 -clock core_clk [get_ports rst]
set_output_delay 1.000 -clock core_clk [all_outputs]
set_clock_uncertainty 0.100 [get_clocks core_clk]
