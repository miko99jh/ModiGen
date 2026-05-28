block SubSample
  extends Modelica.Blocks.Logical.If;
  parameter Boolean inferFactor = true;
  parameter Integer factor = 1;
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y;
equation 
  if inferFactor then
    y = subSample(u);
  else
    y = subSample(u, factor);
  end if;
end SubSample;