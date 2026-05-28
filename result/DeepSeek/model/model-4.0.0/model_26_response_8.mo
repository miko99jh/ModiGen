block BooleanChange extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon(icon="modelica://Modelica.Blocks.Icons/Resources/Icons/BooleanChange.png")
  parameter String componentName = "BooleanChange";
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y = false;
equation
  when clock then
    y = false;
  end when;
  when clock() then
    y = u!= pre(u);
  end when;
end BooleanChange;