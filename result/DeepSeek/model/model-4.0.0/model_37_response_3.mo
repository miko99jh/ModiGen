block AssignClock(final Integer u=10);
  Modelica.Blocks.Interfaces.IntegerInput u;
  Modelica.Blocks.Interfaces.IntegerOutput y;
  Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock;
equation
  when clock then
    y = u;
  end when;
end AssignClock;