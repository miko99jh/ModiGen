model VariableResistor
 extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort;

  parameter Modelica.Units.SI.Temperature T_ref = 300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of resistance";
  
  input Real R(unit="Ohm") "Variable resistance input";
  Modelica.Units.SI.Resistance R_actual "Actual resistance considering temperature effect";

equation
  // Calculate the actual resistance considering the temperature effect
  R_actual = R * (1 + alpha * (T_heatPort - T_ref));

  // Calculate the voltage across the resistor
  v = R_actual * i;

  // Calculate the power loss in the resistor
  LossPower = v * i;

  // Ensure the temperature is within a valid range
  assert(T_heatPort >= 0, "Temperature must be non-negative");

  // Reset the temperature to the reference temperature if heat port is not used
  if not useHeatPort then
    T_heatPort = T_ref;
  end if;

end VariableResistor;