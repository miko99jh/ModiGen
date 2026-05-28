model MixingUnit
  parameter Modelica.Units.SI.Temperature T0 = 308.5;
  parameter Real c0 = 0.848;
  parameter Real a1 = 0.2674;
  parameter Real a21 = 1.815;
  parameter Real a22 = 0.4682;
  parameter Real b = 1.5476;
  parameter Real k0 = 1.05e14;
  parameter Real eps = 34.2894;
  parameter Modelica.Units.SI.Time tau0 = 60;
  Real wk0 = k0/c0;
  Real weps = eps*T0;
  Real wa11 = a1/tau0;
  Real wa12 = c0/tau0;
  Real wa13 = c0*a1/tau0;
  Real wa21 = a21/tau0;
  Real wa22 = a22*T0/tau0;
  Real wa23 = T0*(a21 - b)/tau0;
  Real wb = b/tau0;
  RealInput T_c;
  RealOutput c;
  RealOutput T;
protected 
  Real gamma;
equation 
  gamma = wk0*exp(-weps/(R*T))*c;
  der(c) = wa13 - wa11*c - wa12*gamma;
  der(T) = wa22*gamma - wa21*T + wb*T_c;
end MixingUnit;