block BooleanChange extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon
  parameter Modelica.SIunits.Time samplePeriod=1;
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y=false;
equation
  when clock then
    y = false;
  end when;
  when clock'event and clock > 0 then
    y = u /= pre(u);
  end when;
end BooleanChange;