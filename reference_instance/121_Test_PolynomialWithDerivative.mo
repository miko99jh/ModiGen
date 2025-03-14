model Test_PolynomialWithDerivative
  Real result;
equation
  result = ModelicaByExample.Functions.Polynomials.PolynomialWithDerivative(time,{1,-2,2});
end Test_PolynomialWithDerivative;
