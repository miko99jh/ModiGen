block BooleanChange
  extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon(
    blockName="BooleanChange");
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y = false;
equation
  when clock then
    y = false;
  end when;
  y = if u <> pre(u) then true else false;
end BooleanChange;