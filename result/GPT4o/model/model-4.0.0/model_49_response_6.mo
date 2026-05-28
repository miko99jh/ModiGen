model VariableResistor
 extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final useHeatPort=true);

  parameter Modelica.Units.SI.Temperature T_ref = 300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of resistance";

  input Real R(unit="Ohm") "Variable resistance input";
  Modelica.Units.SI.Resistance R_actual "Actual resistance considering temperature";

equation
  // Calculate the actual resistance considering the temperature effect
  R_actual = R * (1 + alpha * (T_heatPort - T_ref));

  // Assert to ensure temperature is within a valid range
  assert(T_heatPort >= 0, "Temperature must be non-negative");

  // Voltage across the resistor
  v = R_actual * i;

  // Power loss in the resistor
  LossPower = v * i;
end VariableResistor;