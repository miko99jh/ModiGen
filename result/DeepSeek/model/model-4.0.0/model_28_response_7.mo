block ConjunctiveClock extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock
  replace partialCombinator = Modelica.Blocks.Logical.And(n=size(inputs, 1));
end ConjunctiveClock;