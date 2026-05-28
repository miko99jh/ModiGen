model TwoTanks
 parameter Real rho = 0.2 "Oil density";
  parameter Real H1 = 0.4 "Initial height of the liquid in the left tank";
  parameter Real A1 = 1 "Cross-sectional area of the left tank";
  parameter Real H2 = 0.6 "Initial height of the liquid in the right tank";
  parameter Real A2 = 2 "Cross-sectional area of the right tank";
  parameter Real L = 0.1 "Length of the pipe";
  parameter Real D = 0.2 "Diameter of the pipe";
  parameter Real mu = 2e-3 "Dynamic viscosity of the oil";
  parameter Real c = (pi*D^4)/(128*L*mu) "Flow coefficient";
  Real P1(start=rho*g*H1) "Pressure in the left tank";
  Real P2(start=rho*g*H2) "Pressure in the right tank";
  Real Q "Flow rate";
  Real dh1_dt "Rate of change of the height in the left tank";
  Real dh2_dt "Rate of change of the height in the right tank";
equation 
  //equations go here
end TwoTanks;