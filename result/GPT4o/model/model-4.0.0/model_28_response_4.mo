block ConjunctiveClock
 extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock;

  // Redeclare the combinator to use the Boolean AND block
  redeclare Modelica.Blocks.Logical.And combinator;

equation
  // The combinator will perform a logical AND operation on the input clock signals
  connect(inputClocks, combinator.u);
  connect(combinator.y, outputClock);
end ConjunctiveClock;