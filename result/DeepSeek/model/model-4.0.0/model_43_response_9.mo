block Add
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexBlocks.Types.Complex k1 = Complex(1, 0) "Gain factor for input 1";
  parameter Modelica.ComplexBlocks.Types.Complex k2 = Complex(1, 0) "Gain factor for input 2";
  Modelica.ComplexBlocks.Interfaces.ComplexInput u1(final quantity="") = k1*Modelica.ComplexBlocks.Interfaces.ComplexInput();
  Modelica.ComplexBlocks.Interfaces.ComplexInput u2(final quantity="") = k2*Modelica.ComplexBlocks.Interfaces.ComplexInput();
  Modelica.ComplexBlocks.Interfaces.ComplexOutput y(final quantity="") = u1.y + u2.y;
equation 
  connect(u1.pin_p, y.pin_p);
  connect(u1.pin_n, y.pin_n);
  connect(u2.pin_p, y.pin_p);
  connect(u2.pin_n, y.pin_n);
end Add;