block ConjunctiveClock
 extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock(
    redeclare Modelica.Blocks.Logical.And combinator);

  annotation(
    Documentation(info = "A logical clock that ticks when all input clocks have ticked at least once, then resets for the next cycle."),
    Icon(graphics = {
      Rectangle(
        extent = {{-100, -100}, {100, 100}},
        lineColor = {0, 0, 255},
        fillColor = {255, 255, 255},
        lineThickness = 2),
      Text(
        extent = {{-80, 60}, {80, 100}},
        textString = "ConjunctiveClock",
        fontSize = 12,
        textColor = {0, 0, 255})
    }));
end ConjunctiveClock;