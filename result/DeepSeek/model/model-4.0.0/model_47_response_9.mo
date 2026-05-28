model CCC extends Modelica.Electrical.Analog.Interfaces.TwoPort
  parameter Real gain=1.0 "Current gain";
  equation
    v1 = 0;
    i2 = i1 * gain;
end CCC;