model VanDerPol
 // Parameters
  parameter Real lambda = 0.3; // Nonlinearity parameter

  // Variables
  Real x(start=1); // State variable x with initial condition
  Real y(start=1); // State variable y with initial condition

equation
  // Van der Pol oscillator equations
  der(x) = y;
  der(y) = lambda * (1 - x^2) * y - x;

end VanDerPol;