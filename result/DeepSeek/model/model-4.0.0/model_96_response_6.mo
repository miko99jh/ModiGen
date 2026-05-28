model Pipe
 parameter Real P1 = 1080 "Pressure at point 1";
  parameter Real P2 = 900 "Pressure at point 2";
  parameter Real L = 1 "Length of pipe";
  parameter Real D = 0.05 "Inner diameter of pipe";
  parameter Real mu = 2e-3 "Viscosity of fluid";
  Real c "Flow coefficient";
  Real Q "Flow in the pipeline";
  Real v "Velocity";
equation 
  c = (8*mu*L)/(pi^2*D^4);
  Q = c*(P1-P2);
  v = Q/(pi*D^2/4);
end Pipe;