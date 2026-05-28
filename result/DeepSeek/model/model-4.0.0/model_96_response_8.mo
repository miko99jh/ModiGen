model Pipe
  parameter Real P1(unit="Pa") = 1080;
  parameter Real P2(unit="Pa") = 900;
  parameter Real L(unit="m") = 1;
  parameter Real D(unit="m") = 0.05;
  parameter Real mu(unit="Pa*s") = 2e-3;
  Real c(unit="m^4/(kg*s^2)");
  Real Q(unit="m^3/s");
  Real v(unit="m/s");
equation
  c = (8*mu*L)/(pi^2*D^4);
  Q = c*(P1 - P2);
  v = Q/(pi*D^2/4);
end Pipe;