model Pipe
 parameter Real P1 = 1080 "Pressure at the start of the pipe";
  parameter Real P2 = 900 "Pressure at the end of the pipe";
  parameter Real L = 1 "Length of the pipe";
  parameter Real D = 0.05 "Inner diameter of the pipe";
  parameter Real mu = 2e-3 "Viscosity of the fluid";
  Real c(start=0.01) "Flow coefficient";
  Real Q(start=0.01) "Flow in the pipeline";
  Real v(start=0.01) "Velocity";
initial equation
  c = (8*mu*L)/(pi^2*D^4);
equation
  Q = c*(P1 - P2);
  v = Q/(pi*D^2/4);
end Pipe;