block SubSample
 parameter Boolean inferFactor = true "If true, the sub-sampling factor is inferred automatically";
  parameter Integer factor(min=1) = 1 "The sub-sampling factor, ignored if inferFactor is true";

  Modelica.Blocks.Interfaces.BooleanInput u "Clocked Boolean input signal";
  Modelica.Blocks.Interfaces.BooleanOutput y "Clocked Boolean output signal";

equation
  if inferFactor then
    y = subSample(u);
  else
    y = subSample(u, factor);
  end if;
end SubSample;