block BooleanChange1 "Indicate Boolean signal changing"
  extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;

  Modelica.Blocks.Interfaces.BooleanInput u
    "Connector of Boolean input signal."
    annotation (Placement(transformation(extent = {{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.BooleanOutput y
    "Connector of Boolean output signal."
    annotation (Placement(transformation(extent = {{100,-10},{120,10}})));

equation
  if firstTick() then
    y = false;
  else
    y = not (u == previous(u));
  end if;
end BooleanChange1;
