model Lorenz
  parameter Real sigma = 10;
  parameter Real rho = 28;
  parameter Real beta = 8/3;
  parameter Real x0 = 1;
  parameter Real y0 = 1;
  parameter Real z0 = 1;
  Real x(start=x0);
  Real y(start=y0);
  Real z(start=z0);
equation
  der(x) = sigma*(y - x);
  der(y) = x*(rho - z) - y;
  der(z) = x*y - beta*z;
end Lorenz;