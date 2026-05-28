block BooleanChange
  extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y = false;
equation 
  when clock then
    y = false;
  end when;
  when clock'event and clock then
    y = u /= old(u);
  end when;
end BooleanChange;