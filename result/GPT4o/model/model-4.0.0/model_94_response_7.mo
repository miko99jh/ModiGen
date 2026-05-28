model TwoTanks
 // Parameters
  parameter Real rho = 0.2; // Density of oil
  parameter Real mu = 2e-3; // Dynamic viscosity of oil
  parameter Real L = 0.1; // Length of the pipe
  parameter Real D = 0.2; // Diameter of the pipe
  parameter Real A1 = 1; // Cross-sectional area of the left tank
  parameter Real A2 = 2; // Cross-sectional area of the right tank

  // Variables
  Real H1(start=0.4); // Height of liquid in the left tank
  Real H2(start=0.6); // Height of liquid in the right tank
  Real P1; // Pressure in the left tank
  Real P2; // Pressure in the right tank
  Real Q; // Flow rate through the pipe
  Real c; // Flow coefficient

  // Equations
equation
  // Pressure equations
  P1 = rho * H1;
  P2 = rho * H2;

  // Flow coefficient calculation
  c = (pi * D^4) / (128 * mu * L);

  // Flow rate equation (assuming laminar flow)
  Q = c * (P1 - P2);

  // Conservation of mass equations
  der(H1) = -Q / A1;
  der(H2) = Q / A2;
end TwoTanks;