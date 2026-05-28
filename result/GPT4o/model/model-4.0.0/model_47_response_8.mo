model CCC
 extends Modelica.Electrical.Analog.Interfaces.TwoPort;

  parameter Real gain = 1.0 "Current gain";

equation
  // Enforce that the voltage at the input port is zero
  v1 = 0;

  // Define the relationship between input and output currents
  i2 = i1 * gain;
end CCC;