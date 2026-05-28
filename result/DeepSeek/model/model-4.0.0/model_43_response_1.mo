block Add
model Add "Add complex signals"
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexMath.Complex ck1=Complex(1, 0) "Gain factor for u1";
  parameter Modelica.ComplexMath.Complex ck2=Complex(1, 0) "Gain factor for u2";
  Modelica.ComplexMath.ComplexInput ci1(redeclare package Modelica.ComplexMath model=Modelica.ComplexMath.ComplexInput);
  Modelica.ComplexMath.ComplexInput ci2(redeclare package Modelica.ComplexMath model=Modelica.ComplexMath.ComplexInput);
  Modelica.ComplexMath.ComplexOutput co(redeclare package Modelica.ComplexMath model=Modelica.ComplexMath.ComplexOutput);
equation 
  connect(ci1, u1Internal);
  connect(ci2, u2Internal);
  connect(ci1.output, co.input);
  connect(ci2.output, co.input);
  y = ck1*ci1.output + ck2*ci2.output;
end Add;