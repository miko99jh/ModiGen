model MixingUnit
  parameter Real c0 = 0.848 "Nominal concentration";
  parameter Modelica.Units.SI.Temperature T0 = 308.5 "Nominal temperature";
  parameter Real a1 = 0.2674 "Process parameter";
  parameter Real a21 = 1.815 "Process parameter";
  parameter Real a22 = 0.4682 "Process parameter";
  parameter Real b = 1.5476 "Process parameter";
  parameter Real k0 = 1.05e14 "Process parameter";
  parameter Real eps = 34.2894 "Process parameter";
  parameter Modelica.Units.SI.Time tau0 = 60 "Protected parameter related to time constants in the system";
  Real wk0;
  Real weps;
  Real wa11;
  Real wa12;
  Real wa13;
  Real wa21;
  Real wa22;
  Real wa23;
  Real wb;
  RealInput T_c(unit="K") "Cooling temperature";
  RealOutput c(unit="mol/l") "Concentration";
  RealOutput T(unit="K") "Temperature inside the mixing unit";
protected 
  Real gamma;
equation 
  wk0 = k0/c0;
  weps = eps*T0;
  wa11 = a1/tau0;
  wa12 = c0/tau0;
  wa13 = c0*a1/tau0;
  wa21 = a21/tau0;
  wa22 = a22*T0/tau0;
  wa23 = T0*(a21 - b)/tau0;
  wb = b/tau0;
  der(c) = wa13 - wa11*c - wa12*gamma;
  der(T) = wa22*gamma - wa21*T + wb*T_c;
  gamma = wk0*exp(-weps/(T + 273.15))*c;
end MixingUnit;