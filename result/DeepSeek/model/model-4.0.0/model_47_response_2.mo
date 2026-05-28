model CCC extends Modelica.Electrical.Analog.Interfaces.TwoPort(v1 = 0)
  parameter Real gain = 1.0 "Current gain";
  Modelica.SIunits.Current i2(start = 0) "Output current";
equation
  i2 = i1 * gain;
end CCC;