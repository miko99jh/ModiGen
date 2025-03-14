model MixingUnit
  "Mixing unit demo from Foellinger, Nichtlineare Regelungen II, p. 280"

  Modelica.Blocks.Interfaces.RealInput T_c(unit="K")
    "Cooling temperature"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput c(unit="mol/l") "Concentration"
    annotation (Placement(transformation(extent={{100,40},{140,80}})));
  Modelica.Blocks.Interfaces.RealOutput T(unit="K")
    "Temperature in mixing unit"
    annotation (Placement(transformation(extent={{100,-80},{140,-40}})));
  parameter Real c0(unit="mol/l") = 0.848 "Nominal concentration";
  parameter Modelica.Units.SI.Temperature T0 = 308.5 "Nominal temperature";
  parameter Real a1 = 0.2674 "Process parameter (see references in help)";
  parameter Real a21 = 1.815 "Process parameter (see references in help)";
  parameter Real a22 = 0.4682 "Process parameter (see references in help)";
  parameter Real b = 1.5476 "Process parameter (see references in help)";
  parameter Real k0 = 1.05e14 "Process parameter (see references in help)";
  parameter Real eps = 34.2894 "Process parameter (see references in help)";
  Real gamma "Reaction speed";
protected
  parameter Modelica.Units.SI.Time tau0 = 60;
  parameter Real wk0 = k0/c0;
  parameter Real weps = eps*T0;
  parameter Real wa11 = a1/tau0;
  parameter Real wa12 = c0/tau0;
  parameter Real wa13 = c0*a1/tau0;
  parameter Real wa21 = a21/tau0;
  parameter Real wa22 = a22*T0/tau0;
  parameter Real wa23 = T0*(a21 - b)/tau0;
  parameter Real wb = b/tau0;
initial equation  
  T = 1;
equation
  gamma = c*wk0*exp( -weps/T);
  der(c) = -wa11*c - wa12*gamma + wa13;
  der(T) = -wa21*T + wa22*gamma + wa23 + wb*T_c;
end MixingUnit;
