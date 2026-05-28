model VariableResistor
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort;

  parameter Modelica.Units.SI.Temperature T_ref=300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha=0 "Temperature coefficient of resistance";
  RealInput R(unit="Ohm") "Variable resistance input";
  Modelica.Units.SI.Resistance R_actual;

equation 
  assert(T >= T_ref and T <= 1.5*T_ref, "Temperature out of valid scope");
  R_actual = R*(1 + alpha*(T_heatPort - T_ref));
  v = R_actual*i;
  LossPower = v*i;
end VariableResistor;