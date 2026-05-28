function PolynomialWithDerivative
 input Real x; // Independent variable
  input Real c[:]; // Array of polynomial coefficients
  output Real y; // Computed polynomial value
  output Real dy; // Computed derivative value
protected
  Integer n = size(c, 1); // Size of the coefficient array
algorithm
  y := 0.0; // Initialize polynomial value
  dy := 0.0; // Initialize derivative value
  for i in 1:n loop
    y := y + c[i] * x^(i-1); // Compute polynomial value
    if i > 1 then
      dy := dy + (i-1) * c[i] * x^(i-2); // Compute derivative value
    end if;
  end for;
end PolynomialWithDerivative;