block ConjunctiveClock extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock(combinator = Modelica.Blocks.Logical.And(nin=nin));```

This block should have the following parameters:

- `nin` (integer, default: 2): The number of input signals.
- `nout` (integer, default: 1): The number of output signals.

The block should have the following connectors:

- `clk[nin]` (input, Real): The input clock signals.
- `reset` (input, Real): The reset signal.
- `y[nout]` (output, Real): The output signal.

The block should have the following equations:

- The output signal `y` is equal to the result of the logical conjunction of the input clock signals `clk`.
- The reset signal `reset` should reset the internal state of the block.

The block should be placed in a package named `Modelica.Clocked.ClockSignals.Clocks.Logical`.

//modelica
```package Modelica.Clocked.ClockSignals.Clocks.Logical;

block ConjunctiveClock extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock(combinator = Modelica.Blocks.Logical.And(nin=nin));
  parameter Integer nin=2 "The number of input signals";
  parameter Integer nout=1 "The number of output signals";
  input Real clk[nin] "The input clock signals";
  input Real reset "The reset signal";
  output Real y[nout] "The output signal";
equation 
  y = clk;
  reset => reset;
end ConjunctiveClock;