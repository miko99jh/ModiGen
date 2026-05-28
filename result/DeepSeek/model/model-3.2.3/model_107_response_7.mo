model Example
 Real x = 2;
  Real c[3] = {1, 2, 3};
  Real y;
equation 
  y = PolynomialWithDerivative(x, c);
end Example;