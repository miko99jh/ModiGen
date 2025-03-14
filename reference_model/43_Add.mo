block Add1 "Output the sum of the two inputs"
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Complex k1=Complex(1, 0) "Gain of input 1";
  parameter Complex k2=Complex(1, 0) "Gain of input 2";
equation
  y = k1*u1Internal + k2*u2Internal;
end Add1;
