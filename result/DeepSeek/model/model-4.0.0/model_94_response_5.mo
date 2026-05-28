model TwoTanks
  parameter Real rho = 0.2; // oil density
  parameter Real H1 = 0.4; // initial height of oil in tank 1
  parameter Real A1 = 1; // cross-sectional area of tank 1
  parameter Real H2 = 0.6; // initial height of oil in tank 2
  parameter Real A2 = 2; // cross-sectional area of tank 2
  parameter Real L = 0.1; // length of pipe
  parameter Real D = 0.2; // diameter of pipe
  parameter Real mu = 2e-3; // dynamic viscosity of oil
  Real P1(start=1e5); // pressure in tank 1
  Real P2(start=1e5); // pressure in tank 2
  Real Q; // flow rate
  Real c; // flow coefficient
  Real dh1_dt; // rate of change of height in tank 1
  Real dh2_dt; // rate of change of height in tank 2
equation
  c = (pi*D^4)/(128*L*mu); // calculate flow coefficient
  Q = c*sqrt(abs(P1 - P2)); // calculate flow rate
  dh1_dt = -Q/A1; // conservation of mass for tank 1
  dh2_dt = Q/A2; // conservation of mass for tank 2
end TwoTanks;