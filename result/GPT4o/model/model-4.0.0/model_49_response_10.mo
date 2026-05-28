model VariableResistor
 extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort;

  parameter Modelica.Units.SI.Temperature T_ref = 300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of resistance";
  input Real R(unit="Ohm") "Variable resistance input";
  Modelica.Units.SI.Resistance R_actual "Actual resistance";

equation
  // Calculate actual resistance based on temperature
  R_actual = R * (1 + alpha * (T_heatPort - T_ref));

  // Calculate voltage across the resistor
  v = R_actual * i;

  // Calculate power loss in the resistor
  LossPower = v * i;

  // Assert that the temperature is within a valid scope
  assert(T_heatPort >= 0, "Temperature must be non-negative");

initial equation
  // Reset temperature to reference temperature
  T_heatPort = T_ref;
end VariableResistor;