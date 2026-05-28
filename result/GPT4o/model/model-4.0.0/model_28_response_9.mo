block ConjunctiveClock
 extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock;

  // Redeclare the combinator to use the Boolean AND block
  redeclare Modelica.Blocks.Logical.And combinator(nu=nu);

equation
  // The combinator will perform a logical AND operation on the input clocks
  // The block will tick when all input clocks have ticked at least once
  // The combinator is automatically connected to the input clocks in PartialLogicalClock
end ConjunctiveClock;