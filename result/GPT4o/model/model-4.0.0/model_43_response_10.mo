block Add
 extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;

  parameter Modelica.ComplexBlocks.ComplexGain k1 = Complex(1, 0) "Gain factor for input u1Internal";
  parameter Modelica.ComplexBlocks.ComplexGain k2 = Complex(1, 0) "Gain factor for input u2Internal";

protected 
  Modelica.ComplexBlocks.ComplexGain gain1(k=k1);
  Modelica.ComplexBlocks.ComplexGain gain2(k=k2);

equation
  // Apply gain to each input
  gain1.u = u1Internal;
  gain2.u = u2Internal;

  // Output the sum of the weighted inputs
  y = gain1.y + gain2.y;
end Add;