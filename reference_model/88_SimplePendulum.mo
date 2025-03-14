model SimplePendulum1
  parameter Real L = 1;
  parameter Real m = 1;
  parameter Real g = 9.81;
  Real theta(start=1.5, fixed=false);
  Real omega(start=0);
equation
  der(theta) = omega;
  der(omega) = -g/L * sin(theta);
end SimplePendulum1;
