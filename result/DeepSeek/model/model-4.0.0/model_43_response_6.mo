block Add
model Add
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexBlocks.Types.Complex k1 = Modelica.ComplexBlocks.Types.Complex(1, 0) "Gain factor for first input";
  parameter Modelica.ComplexBlocks.Types.Complex k2 = Modelica.ComplexBlocks.Types.Complex(1, 0) "Gain factor for second input";
  Modelica.ComplexBlocks.Sources.ComplexConstant c1(k=k1);
  Modelica.ComplexBlocks.Sources.ComplexConstant c2(k=k2);
  Modelica.ComplexBlocks.Adders.ComplexAdder a1;
  Modelica.ComplexBlocks.Adders.ComplexAdder a2;
equation 
  connect(c1.y, a1.u1) annotation(Line(color = {0, 0, 0}, smooth = Smooth.None));
  connect(c2.y, a2.u1) annotation(Line(color = {0, 0, 0}, smooth = Smooth.None));
  connect(a1.u2, a2.u2) annotation(Line(color = {0, 0, 0}, smooth = Smooth.None));
  connect(a2.y, y) annotation(Line(color = {0, 0, 0}, smooth = Smooth.None));
  connect(u1Internal, c1.u) annotation(Line(color = {0, 0, 0}, smooth = Smooth.None));
  connect(u2Internal, c2.u) annotation(Line(color = {0, 0, 0}, smooth = Smooth.None));
end Add;