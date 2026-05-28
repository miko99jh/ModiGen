block BooleanChange
  extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y = false;
equation
  when clock then
    y = false;
  else when u' then
    y = true;
  end when;
end BooleanChange;