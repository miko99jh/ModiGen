model Pipe
 // Parameters
  parameter Real P1 = 1080; // Pressure at the inlet [Pa]
  parameter Real P2 = 900;  // Pressure at the outlet [Pa]
  parameter Real L = 1;     // Length of the pipe [m]
  parameter Real D = 0.05;  // Inner diameter of the pipe [m]
  parameter Real mu = 2e-3; // Viscosity of the fluid [Pa.s]

  // Variables
  Real c;  // Flow coefficient
  Real Q;  // Flow rate [m^3/s]
  Real v;  // Velocity [m/s]
  Real deltaP; // Pressure difference [Pa]
  Real A;  // Cross-sectional area [m^2]

equation
  // Calculate pressure difference
  deltaP = P1 - P2;

  // Calculate cross-sectional area
  A = (pi * D^2) / 4;

  // Calculate flow coefficient using Hagen-Poiseuille equation
  c = (pi * D^4) / (128 * mu * L);

  // Calculate flow rate
  Q = c * deltaP;

  // Calculate velocity
  v = Q / A;
end Pipe;