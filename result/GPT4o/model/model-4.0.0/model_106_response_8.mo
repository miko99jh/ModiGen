model Lorenz
 // Parameters
  parameter Real sigma = 10;
  parameter Real rho = 28;
  parameter Real beta = 8/3;

  // State variables
  Real x(start = 1);
  Real y(start = 1);
  Real z(start = 1);

equation
  // Lorenz system equations
  der(x) = sigma * (y - x);
  der(y) = x * (rho - z) - y;
  der(z) = x * y - beta * z;
end Lorenz;