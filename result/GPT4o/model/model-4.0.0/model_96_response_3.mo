model Pipe
 // Parameters
  parameter Real P1 = 1080; // Pressure at inlet [Pa]
  parameter Real P2 = 900;  // Pressure at outlet [Pa]
  parameter Real L = 1;     // Pipe length [m]
  parameter Real D = 0.05;  // Pipe inner diameter [m]
  parameter Real mu = 2e-3; // Fluid viscosity [Pa.s]

  // Variables
  Real c;                   // Flow coefficient [m^3/(Pa.s)]
  Real Q;                   // Flow rate [m^3/s]
  Real v;                   // Velocity [m/s]
  Real deltaP;              // Pressure difference [Pa]
  Real A;                   // Cross-sectional area [m^2]

equation
  // Calculate pressure difference
  deltaP = P1 - P2;

  // Cross-sectional area of the pipe
  A = pi * (D/2)^2;

  // Hagen-Poiseuille flow coefficient
  c = (pi * D^4) / (128 * mu * L);

  // Flow rate using Hagen-Poiseuille relationship
  Q = c * deltaP;

  // Velocity derived from flow rate and cross-sectional area
  v = Q / A;
end Pipe;