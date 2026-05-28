function PolynomialWithDerivative
 input Real x; // Independent variable
  input Real c[:]; // Array of polynomial coefficients
  output Real y; // Computed polynomial value
protected
  Integer n = size(c, 1); // Size of the coefficient array
algorithm
  y := 0.0; // Initialize polynomial value
  for i in 1:n loop
    y := y + c[i] * x^(i-1); // Update polynomial value
  end for;
end PolynomialWithDerivative;