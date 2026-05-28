model MixingUnit
  extends Modelica.Icons.Function;

  parameter Modelica.Units.SI.Temperature T0 = 308.5 "Nominal temperature";
  parameter Real c0 = 0.848 "Nominal concentration";
  parameter Real a1 = 0.2674 "Process parameter";
  parameter Real a21 = 1.815 "Process parameter";
  parameter Real a22 = 0.4682 "Process parameter";
  parameter Real b = 1.5476 "Process parameter";
  parameter Real k0 = 1.05e14 "Process parameter";
  parameter Real eps = 34.2894 "Process parameter";
  parameter Modelica.Units.SI.Time tau0 = 60 "Time constant";

  input Real T_c "Cooling temperature";
  output Real c "Concentration";
  output Real T "Temperature";

  protected 
    Real wk0 = k0/c0 "Frequency factor";
    Real weps = eps*T0 "Activation energy constant";
    Real wa11 = a1/tau0 "Dilution/feed term";
    Real wa12 = c0/tau0 "Decay term";
    Real wa13 = c0*a1/tau0 "Reaction consumption term";
    Real wa21 = a21/tau0 "Heat loss/gain term";
    Real wa22 = a22*T0/tau0 "Heat of reaction term";
    Real wa23 = T0*(a21 - b)/tau0 "External cooling temperature term";
    Real wb = b/tau0 "Cooling temperature coefficient";
    Real gamma "Reaction speed";

  equation 
    // Reaction Kinetics
    gamma = wk0*exp(-weps/(R*T))*c*((T/T0)^(-1 + a22))*exp(-a21/R/T);

    // Mass Balance
    der(c) = wa13 - wa11*c - wa12*gamma;

    // Energy Balance
    der(T) = wa22*gamma - wa21*T + wb*T_c;
end MixingUnit;