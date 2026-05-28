block BooleanChange extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon
  input Modelica.Blocks.Interfaces.BooleanInput u;
  output Modelica.Blocks.Interfaces.BooleanOutput y = false;
equation
  y = if clock then u else y;
end BooleanChange;