block AssignClock
model AssignClock
  Modelica.Blocks.Interfaces.IntegerInput u;
  Modelica.Blocks.Interfaces.IntegerOutput y;
  Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock;
equation
  when clock then
    y = u;
  end when;
end AssignClock;