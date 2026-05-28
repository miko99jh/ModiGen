block Add
 extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;

  parameter Complex k1 = Complex(1, 0) "Gain factor for input signal u1Internal";
  parameter Complex k2 = Complex(1, 0) "Gain factor for input signal u2Internal";

protected
  Complex u1Weighted;
  Complex u2Weighted;

equation
  // Compute weighted inputs
  u1Weighted = k1 * u1Internal;
  u2Weighted = k2 * u2Internal;

  // Output the sum of weighted inputs
  y = u1Weighted + u2Weighted;

end Add;