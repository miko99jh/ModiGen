model MixingUnit
  parameter Modelica.Units.SI.Temperature T0 = 308.5 "Nominal temperature";
  parameter Real c0 = 0.848 "Nominal concentration";
  parameter Real a1 = 0.2674 "Process parameter";
  parameter Real a21 = 1.815 "Process parameter";
  parameter Real a22 = 0.4682 "Process parameter";
  parameter Real b = 1.5476 "Process parameter";
  parameter Real k0 = 1.05e14 "Process parameter";
  parameter Real eps = 34.2894 "Process parameter";
  parameter Modelica.Units.SI.Time tau0 = 60 "Time constant";
  Real wk0;
  Real weps;
  Real wa11;
  Real wa12;
  Real wa13;
  Real wa21;
  Real wa22;
  Real wa23;
  Real wb;
  Real gamma;
  Real c;
  Real T;
  RealInput T_c;
  RealOutput c;
  RealOutput T;
protected 
  parameter Real k = k0/c0;
  parameter Real w = eps*T0;
initial equation 
  c = c0;
  T = T0;
equation 
  wk0 = k;
  weps = w;
  wa11 = a1/tau0;
  wa12 = c0/tau0;
  wa13 = c0*a1/tau0;
  wa21 = a21/tau0;
  wa22 = a22*T0/tau0;
  wa23 = T0*(a21 - b)/tau0;
  wb = b/tau0;
  gamma = wk0*exp(-w/T)*c^a22*T^a21;
  der(c) = wa13 - wa11*c - wa12*gamma;
  der(T) = wa21*T - wa22*gamma + wb*T_c;
end MixingUnit;