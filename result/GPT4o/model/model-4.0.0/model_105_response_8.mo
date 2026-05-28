model VanDerPol
 // Parameters
  parameter Real lambda = 0.3;

  // State variables
  Real x(start=1);
  Real y(start=1);

equation
  // Van der Pol oscillator equations
  der(x) = y;
  der(y) = lambda * (1 - x^2) * y - x;
end VanDerPol;