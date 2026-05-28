function PolynomialWithDerivative
  input Real x;
  input Real c[:];
  output Real y;
  protected Integer n = size(c,1);
algorithm 
  y := c[n];
  for i in 1:n-1 loop
    y := y*x + c[n-i];
  end for;
end PolynomialWithDerivative;