model VanDerPol
 // Parameters
  parameter Real lambda = 0.3; // Nonlinearity parameter

  // Variables
  Real x(start=1); // Initial condition for x
  Real y(start=1); // Initial condition for y

equation
  // Van der Pol oscillator equations
  der(x) = y;
  der(y) = lambda * (1 - x^2) * y - x;

end VanDerPol;