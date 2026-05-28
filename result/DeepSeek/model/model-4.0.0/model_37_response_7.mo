block AssignClock(final Integer u=1, final Integer y=0)
  extends Modelica.Blocks.Interfaces.IntegerInput,
         Modelica.Blocks.Interfaces.IntegerOutput,
         Modelica.Clocked.ClockSignals.Interfaces.ClockInput;
equation
  when clock then
    y = u;
  end when;
end AssignClock;