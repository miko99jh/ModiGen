block ConjunctiveClock1
  "Logical clock ticking whenever all input clocks ticked at least once, then resets and starts the next conjunctive cycle"
  extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock(
    redeclare Modelica.Blocks.MathBoolean.And combinator);
end ConjunctiveClock1;
