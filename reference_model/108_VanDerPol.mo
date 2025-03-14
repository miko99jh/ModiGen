// Van der Pol oscillator
model VanDerPol1 "Van der Pol oscillator model"
  Real x(start=1) "Descriptive string for x";
  Real y(start=1) "Descriptive string for y";
  parameter Real lambda = 0.3;
equation
  // Differential equations
  der(x) = y;
  der(y) = -x+lambda*(1-x*x)*y;
end VanDerPol1;
