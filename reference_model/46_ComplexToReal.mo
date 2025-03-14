block ComplexToReal "Converts complex to Cartesian representation"
  extends Modelica.ComplexBlocks.Icons.ComplexBlock;
  Modelica.Blocks.Interfaces.RealOutput re annotation (Placement(transformation(
          extent={{100,40},{140,80}}), iconTransformation(extent={{100,40},
            {140,80}})));
  Modelica.Blocks.Interfaces.RealOutput im annotation (Placement(transformation(
          extent={{100,-80},{140,-40}}), iconTransformation(extent={{100,-80},
            {140,-40}})));
  Modelica.ComplexBlocks.Interfaces.ComplexInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  parameter Boolean useConjugateInput=false
    "If true, input is processed conjugate complex";
equation
  re = u.re;
  im = (if useConjugateInput then -u.im else u.im);
end ComplexToReal;
