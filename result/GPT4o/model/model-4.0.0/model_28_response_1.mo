block ConjunctiveClock
 extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock;

  // Redeclare the combinator to perform logical conjunction (AND)
  redeclare Modelica.Blocks.Logical.And combinator;

end ConjunctiveClock;