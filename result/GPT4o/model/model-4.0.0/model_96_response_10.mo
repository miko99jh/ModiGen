model Pipe
 // Parameters
  parameter Real P1 = 1080; // Pressure at the inlet (Pa)
  parameter Real P2 = 900;  // Pressure at the outlet (Pa)
  parameter Real L = 1;     // Length of the pipe (m)
  parameter Real D = 0.05;  // Inner diameter of the pipe (m)
  parameter Real mu = 2e-3; // Viscosity of the fluid (Pa.s)

  // Constants
  constant Real pi = 3.141592653589793;

  // Variables
  Real c;  // Flow coefficient
  Real Q;  // Flow rate (m^3/s)
  Real v;  // Velocity (m/s)
  Real deltaP; // Pressure difference (Pa)
  Real A;  // Cross-sectional area of the pipe (m^2)

equation
  // Calculate the pressure difference
  deltaP = P1 - P2;

  // Calculate the cross-sectional area of the pipe
  A = pi * (D/2)^2;

  // Calculate the flow coefficient using the Hagen-Poiseuille equation
  c = (pi * D^4) / (128 * mu * L);

  // Calculate the flow rate
  Q = c * deltaP;

  // Calculate the velocity
  v = Q / A;

end Pipe;