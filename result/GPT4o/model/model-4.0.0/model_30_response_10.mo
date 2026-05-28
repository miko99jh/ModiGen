model MixingUnit
 // Inputs
  RealInput T_c(unit="K") "Cooling temperature input";

  // Outputs
  RealOutput c(unit="mol/l") "Concentration output";
  RealOutput T(unit="K") "Temperature output";

  // Parameters
  parameter Real c0 = 0.848 "Nominal concentration";
  parameter Modelica.Units.SI.Temperature T0 = 308.5 "Nominal temperature";
  parameter Real a1 = 0.2674 "Process parameter";
  parameter Real a21 = 1.815 "Process parameter";
  parameter Real a22 = 0.4682 "Process parameter";
  parameter Real b = 1.5476 "Process parameter";
  parameter Real k0 = 1.05e14 "Frequency factor";
  parameter Real eps = 34.2894 "Activation energy constant";

  // Protected variables
  protected
  parameter Modelica.Units.SI.Time tau0 = 60 "Time constant";
  parameter Real wk0 = k0/c0 "Pre-calculated frequency factor";
  parameter Real weps = eps*T0 "Pre-calculated activation energy constant";
  parameter Real wa11 = a1/tau0 "Decay term coefficient";
  parameter Real wa12 = c0/tau0 "Consumption term coefficient";
  parameter Real wa13 = c0*a1/tau0 "Dilution/feed term coefficient";
  parameter Real wa21 = a21/tau0 "Flow term coefficient";
  parameter Real wa22 = a22*T0/tau0 "Heat of reaction coefficient";
  parameter Real wa23 = T0*(a21 - b)/tau0 "Temperature influence coefficient";
  parameter Real wb = b/tau0 "Cooling influence coefficient";

  // Variables
  Real gamma "Reaction speed";

equation
  // Reaction kinetics
  gamma = wk0 * exp(-weps / T) * c;

  // Mass balance for concentration
  der(c) = wa13 - wa11*c - wa12*gamma;

  // Energy balance for temperature
  der(T) = wa22*gamma - wa21*T + wb*T_c;
end MixingUnit;