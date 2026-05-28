function PolynomialWithDerivative
  input Real x;
  input Real c[:];
  output Real y;
  protected Integer n = size(c,1);
algorithm 
  y := 0;
  for i in 1:n loop
    y := y*x + c[i];
  end for;
end PolynomialWithDerivative;