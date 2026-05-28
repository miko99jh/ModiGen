model CCC extends Modelica.Electrical.Analog.Interfaces.TwoPort
  parameter Real gain=1.0 "Current gain";
  Real i2 "Output current";
equation 
  v1 = 0; //enforce that the voltage at the input port is set to zero
  i2 = i1 * gain; //control the output current based on the input current with a linear relationship
end CCC;