block SubSample
  extends Modelica.Blocks.Logical.If;
  parameter Boolean inferFactor=true;
  parameter Integer factor(min=1)=1;
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y;
equation
  if inferFactor then
    y = Modelica.Blocks.Logical.subSample(u);
  else
    y = Modelica.Blocks.Logical.subSample(u, factor);
  end if;
end SubSample;