model Test_Polynomial
  Real y;
equation
  y = ModelicaByExample.Functions.Polynomials.Polynomial(time, {1, -2, 2});
end Test_Polynomial;
