model VanDerPol
 parameter Real lambda = 0.3; // Damping parameter
  Real x(start=1); // State variable x
  Real y(start=1); // State variable y

equation
  der(x) = y; // Derivative of x
  der(y) = lambda * (1 - x^2) * y - x; // Derivative of y based on Van der Pol equation

end VanDerPol;