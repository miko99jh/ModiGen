model TwoTanks
  parameter Real rho = 0.2 "Oil density";
  parameter Real H1 = 0.4 "Initial height of oil in tank 1";
  parameter Real A1 = 1 "Cross-sectional area of tank 1";
  parameter Real H2 = 0.6 "Initial height of oil in tank 2";
  parameter Real A2 = 2 "Cross-sectional area of tank 2";
  parameter Real L = 0.1 "Length of the pipe";
  parameter Real D = 0.2 "Diameter of the pipe";
  parameter Real mu = 2e-3 "Dynamic viscosity of the oil";
  parameter Real c = (pi*D^4)/(128*L*mu) "Flow coefficient";
  Real P1(start=101325) "Pressure in tank 1";
  Real P2(start=101325) "Pressure in tank 2";
  Real Q "Flow rate";
  Real dh1_dt "Rate of change of height in tank 1";
  Real dh2_dt "Rate of change of height in tank 2";
equation 
  //equations for pressures P1 and P2
  //equation for flow rate Q
  //equation for conservation of mass
  //determine the rate of change of the heights dh1_dt and dh2_dt
end TwoTanks;