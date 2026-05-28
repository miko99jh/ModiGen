block Add
model Add "Sum of two complex signals"
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexMath.Complex ck1=Complex(1, 0) "Gain factor for u1";
  parameter Modelica.ComplexMath.Complex ck2=Complex(1, 0) "Gain factor for u2";
  Modelica.ComplexMath.ComplexInput ci[2] annotation(Placement(transformation(extent={{-10,-10},{-10,10}})));
  Modelica.ComplexMath.ComplexOutput co annotation(Placement(transformation(extent={{10,-10},{30,10}})));
equation 
  connect(ci[1], u1Internal);
  connect(ci[2], u2Internal);
  co = ck1*ci[1] + ck2*ci[2];
end Add;