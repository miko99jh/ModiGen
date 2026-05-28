model CCC extends Modelica.Electrical.Analog.Interfaces.TwoPort
  parameter Real gain = 1.0 "Current gain";
  Modelica.SIunits.Current i2;
  equation
    v1 = 0;
    i2 = i1 * gain;
end CCC;