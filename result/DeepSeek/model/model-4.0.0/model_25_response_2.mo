block SubSample
  extends Modelica.Blocks.Icons.Block;
  parameter Boolean inferFactor = true "If true, the sub-sampling factor is inferred automatically";
  parameter Integer factor(min=1) = 1 "The sub-sampling factor, ignored if 'inferFactor' is true";
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y;
equation 
  if inferFactor then
    y = Modelica.Blocks.Types.subSample(u);
  else
    y = Modelica.Blocks.Types.subSample(u, factor);
  end if;
end SubSample;