function PolynomialWithDerivative
 input Real x; // Independent variable
  input Real c[:]; // Array of polynomial coefficients
  output Real y; // Computed polynomial value
  output Real dy; // Computed derivative of the polynomial
protected
  Integer n = size(c, 1); // Size of the coefficient array
algorithm
  y := 0.0;
  dy := 0.0;
  for i in 1:n loop
    y := y * x + c[i];
    if i < n then
      dy := dy * x + c[i] * (n - i);
    end if;
  end for;
end PolynomialWithDerivative;