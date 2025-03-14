model Lorenz1 "Lorenz system"
  parameter Real sigma=10;
  parameter Real rho=28;
  parameter Real beta=8/3;

  parameter Real x0=1 "initial value of x";
  parameter Real y0=1 "initial value of y";
  parameter Real z0=1 "initial value of z";

  Real x "x-coordinate";
  Real y "y-coordinate";
  Real z "z-coordinate";
initial equation
  x = x0;
  y = y0;
  z = z0;
equation
  der(x) = sigma*(y - x);
  der(y) = x*(rho - z) - y;
  der(z) = x*y - beta*z;
  annotation (experiment(
      StopTime=1,
      Interval=0.01,
      __Dymola_Algorithm="Dassl"));
end Lorenz1;
