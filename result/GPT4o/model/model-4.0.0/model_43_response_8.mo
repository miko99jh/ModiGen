block Add
 extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;

  parameter Modelica.ComplexBlocks.Complex k1 = Complex(1, 0) "Gain factor for input u1Internal";
  parameter Modelica.ComplexBlocks.Complex k2 = Complex(1, 0) "Gain factor for input u2Internal";

protected
  Modelica.ComplexBlocks.Complex u1Weighted;
  Modelica.ComplexBlocks.Complex u2Weighted;

equation
  // Compute weighted inputs
  u1Weighted = k1 * u1Internal;
  u2Weighted = k2 * u2Internal;

  // Output the sum of weighted inputs
  y = u1Weighted + u2Weighted;

end Add;