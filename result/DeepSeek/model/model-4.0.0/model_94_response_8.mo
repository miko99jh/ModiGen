model TwoTanks
  parameter Real rho = 0.2; // density of oil
  parameter Real H1 = 0.4; // initial height of oil in left tank
  parameter Real A1 = 1; // cross-sectional area of left tank
  parameter Real H2 = 0.6; // initial height of oil in right tank
  parameter Real A2 = 2; // cross-sectional area of right tank
  parameter Real L = 0.1; // length of pipe
  parameter Real D = 0.2; // diameter of pipe
  parameter Real mu = 2e-3; // dynamic viscosity of oil
  parameter Real c = (pi*L*D^4)/(128*mu*A1*A2); // flow coefficient
  Real P1; // pressure in left tank
  Real P2; // pressure in right tank
  Real Q; // flow rate
  Real dh1_dt; // rate of change of height in left tank
  Real dh2_dt; // rate of change of height in right tank
equation 
  // equations for pressures P1 and P2
  // equation for flow rate Q
  // conservation of mass equations for dh1_dt and dh2_dt
end TwoTanks;