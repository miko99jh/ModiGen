block Add
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexMath.Complex k1=Complex(1, 0) "Gain factor 1";
  parameter Modelica.ComplexMath.Complex k2=Complex(1, 0) "Gain factor 2";
  Modelica.ComplexMath.Complex u1=k1*u1Internal "Input signal 1";
  Modelica.ComplexMath.Complex u2=k2*u2Internal "Input signal 2";
equation 
  y = u1 + u2;
end Add;