block SubSample1
  "Sub-sample the clocked Boolean input signal and provide it as clocked output signal"
  parameter Boolean inferFactor(start=true)
    "= true, if sub-sampling factor is inferred";
  parameter Integer factor(min=1)=1
    "Sub-sampling factor >= 1 (ignored if inferFactor=true)"
                                                            annotation(Evaluate=true, Dialog(enable=not inferFactor));

  Modelica.Blocks.Interfaces.BooleanInput
                                       u
    "Connector of clocked, Boolean input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.BooleanOutput
                                        y
    "Connector of clocked, Boolean output signal (clock of y is slower as clock of u)"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  if inferFactor then
     y = subSample(u);
  else
     y = subSample(u,factor);
  end if;
end SubSample1;
