block SubSample
 parameter Boolean inferFactor = true "If true, infer sub-sampling factor automatically";
  parameter Integer factor(min=1) = 1 "Sub-sampling factor, ignored if inferFactor is true";

  Modelica.Blocks.Interfaces.BooleanInput u "Clocked Boolean input signal";
  Modelica.Blocks.Interfaces.BooleanOutput y "Clocked Boolean output signal";

equation
  if inferFactor then
    y = subSample(u);
  else
    y = subSample(u, factor);
  end if;
end SubSample;