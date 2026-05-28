model VariableResistor
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort;

  parameter Modelica.Units.SI.Temperature T_ref = 300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of resistance";
  RealInput R(unit="Ohm") "Variable resistance input";
  Modelica.Units.SI.Resistance R_actual;

equation 
  assert(T >= T_ref, "Temperature is below reference temperature");
  assert(T <= 1000, "Temperature is above 1000K, which is not valid");

  R_actual = R*(1 + alpha*(T_heatPort - T_ref));
  v = R_actual*i;
  LossPower = v*i;
end VariableResistor;