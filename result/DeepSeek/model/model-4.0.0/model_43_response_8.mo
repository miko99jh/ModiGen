block Add
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexBlocks.Types.Complex k1=Complex(1, 0) "Gain for input 1";
  parameter Modelica.ComplexBlocks.Types.Complex k2=Complex(1, 0) "Gain for input 2";
  Modelica.ComplexBlocks.Sources.ComplexConstant c1(k=k1);
  Modelica.ComplexBlocks.Sources.ComplexConstant c2(k=k2);
  Modelica.ComplexBlocks.Adders.ComplexAdder a;
equation 
  connect(c1.y, a.u1);
  connect(c2.y, a.u2);
  connect(a.y, y);
  connect(u1Internal, c1.u);
  connect(u2Internal, c2.u);
end Add;