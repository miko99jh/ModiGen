model Pipe
  parameter Real P1 = 1080 "Pressure at the start of the pipe";
  parameter Real P2 = 900 "Pressure at the end of the pipe";
  parameter Real L = 1 "Length of the pipe";
  parameter Real D = 0.05 "Inner diameter of the pipe";
  parameter Real mu = 2e-3 "Viscosity of the fluid";
  Real c "Flow coefficient";
  Real Q "Flow in the pipeline";
  Real v "Velocity";
equation 
  // equation for the flow coefficient
  c = (8*mu*L)/(pow(D,4));
  // equation for the flow in the pipeline
  Q = c*(P1 - P2);
  // equation for the velocity
  v = Q/(pi()*pow(D,2)/4);
end Pipe;