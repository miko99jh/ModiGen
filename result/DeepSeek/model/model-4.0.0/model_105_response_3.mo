model VanDerPol
  parameter Real lambda = 0.3;
  Real x(start=1);
  Real y(start=1);
equation
  der(x) = y;
  der(y) = lambda*(1-x*x)*y - x;
end VanDerPol;