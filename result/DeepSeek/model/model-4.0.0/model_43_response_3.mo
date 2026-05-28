block Add
model Add
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexBlocks.Types.Complex k1 = Modelica.ComplexBlocks.Types.Complex(1, 0)
    "Gain factor for input signal 1";
  parameter Modelica.ComplexBlocks.Types.Complex k2 = Modelica.ComplexBlocks.Types.Complex(1, 0)
    "Gain factor for input signal 2";
  Modelica.ComplexBlocks.Interfaces.ComplexInput u1(redeclare model Modelica.Blocks.Interfaces.RealInput u1Real, redeclare model Modelica.Blocks.Interfaces.RealInput u1Imag);
  Modelica.ComplexBlocks.Interfaces.ComplexInput u2(redeclare model Modelica.Blocks.Interfaces.RealInput u2Real, redeclare model Modelica.Blocks.Interfaces.RealInput u2Imag);
  Modelica.ComplexBlocks.Interfaces.ComplexOutput y(redeclare model Modelica.Blocks.Interfaces.RealOutput yReal, redeclare model Modelica.Blocks.Interfaces.RealOutput yImag);
equation 
  u1Real = k1.re * u1Internal.re - k1.im * u1Internal.im;
  u1Imag = k1.re * u1Internal.im + k1.im * u1Internal.re;
  u2Real = k2.re * u2Internal.re - k2.im * u2Internal.im;
  u2Imag = k2.re * u2Internal.im + k2.im * u2Internal.re;
  yReal = u1Real + u2Real;
  yImag = u1Imag + u2Imag;
end Add;