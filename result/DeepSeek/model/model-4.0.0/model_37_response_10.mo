block AssignClock
model AssignClock
  Modelica.Blocks.Interfaces.IntegerInput u;
  Modelica.Blocks.Interfaces.IntegerOutput y;
  Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock;
equation
  y = when clock then u;
end AssignClock;