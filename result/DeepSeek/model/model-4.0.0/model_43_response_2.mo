block Add
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexBlocks.Types.Complex k1 = Complex(1, 0) "Gain factor for u1";
  parameter Modelica.ComplexBlocks.Types.Complex k2 = Complex(1, 0) "Gain factor for u2";
  Modelica.ComplexBlocks.Sources.ComplexConstant c1(k=k1);
  Modelica.ComplexBlocks.Sources.ComplexConstant c2(k=k2);
  Modelica.ComplexBlocks.Adders.ComplexAdder a1;
  Modelica.ComplexBlocks.Adders.ComplexAdder a2;
equation 
  connect(c1.y, a1.u1);
  connect(c2.y, a2.u1);
  connect(a1.u2, u1Internal);
  connect(a2.u2, u2Internal);
  connect(a1.y, a2.u2);
  y = a2.y;
end Add;