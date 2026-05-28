model TwoTanks
 parameter Real rho = 0.2; // density of oil
  parameter Real H1 = 0.4; // initial height of oil in the left tank
  parameter Real A1 = 1; // cross-sectional area of the left tank
  parameter Real H2 = 0.6; // initial height of oil in the right tank
  parameter Real A2 = 2; // cross-sectional area of the right tank
  parameter Real L = 0.1; // length of the pipe
  parameter Real D = 0.2; // diameter of the pipe
  parameter Real mu = 2e-3; // dynamic viscosity of the oil
  parameter Real c = (pi*D^4)/(128*L*mu); // flow coefficient
  Real P1; // pressure in the left tank
  Real P2; // pressure in the right tank
  Real Q; // flow rate
  Real dh1_dt; // rate of change of the height of oil in the left tank
  Real dh2_dt; // rate of change of the height of oil in the right tank
equation 
  // equations for pressures
  P1 = rho*9.81*H1;
  P2 = rho*9.81*H2;
  // equation for flow rate
  Q = c*(P1 - P2);
  // conservation of mass
  dh1_dt = -Q/A1;
  dh2_dt = Q/A2;
end TwoTanks;