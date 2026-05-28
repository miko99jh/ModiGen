model TwoTanks
 // Parameters
  parameter Real rho = 0.2 "Density of oil";
  parameter Real A1 = 1 "Cross-sectional area of left tank";
  parameter Real A2 = 2 "Cross-sectional area of right tank";
  parameter Real L = 0.1 "Length of connecting pipe";
  parameter Real D = 0.2 "Diameter of connecting pipe";
  parameter Real mu = 2e-3 "Dynamic viscosity of oil";
  parameter Real g = 9.81 "Acceleration due to gravity";

  // Variables
  Real H1(start=0.4) "Height of liquid in left tank";
  Real H2(start=0.6) "Height of liquid in right tank";
  Real P1 "Pressure in left tank";
  Real P2 "Pressure in right tank";
  Real Q "Flow rate through the pipe";
  Real c "Flow coefficient";

equation
  // Calculate pressures in the tanks
  P1 = rho * g * H1;
  P2 = rho * g * H2;

  // Calculate flow coefficient
  c = (pi * D^4) / (128 * mu * L);

  // Flow rate through the pipe
  Q = c * (P1 - P2);

  // Conservation of mass for the left tank
  der(H1) = -Q / A1;

  // Conservation of mass for the right tank
  der(H2) = Q / A2;
end TwoTanks;