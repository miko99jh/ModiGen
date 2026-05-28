model TwoTanks
 parameter Real rho = 0.2 "Oil density";
  parameter Real H1 = 0.4 "Initial height of oil in the left tank";
  parameter Real A1 = 1 "Cross-sectional area of the left tank";
  parameter Real H2 = 0.6 "Initial height of oil in the right tank";
  parameter Real A2 = 2 "Cross-sectional area of the right tank";
  parameter Real L = 0.1 "Length of the pipe";
  parameter Real D = 0.2 "Diameter of the pipe";
  parameter Real mu = 2e-3 "Dynamic viscosity of the oil";
  parameter Real c = (pi*D^4)/(128*L*mu) "Flow coefficient";
  Real P1(unit="Pa") "Pressure in the left tank";
  Real P2(unit="Pa") "Pressure in the right tank";
  Real Q(unit="m^3/s") "Flow rate";
  Real dh1_dt(unit="m/s") "Rate of change of height in the left tank";
  Real dh2_dt(unit="m/s") "Rate of change of height in the right tank";
equation 
  P1 = P2;
  Q = c * sqrt(abs(P1 - P2));
  dh1_dt = Q / A1;
  dh2_dt = -Q / A2;
end TwoTanks;