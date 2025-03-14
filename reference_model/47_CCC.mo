model CCC "Linear current-controlled current source"
  extends Modelica.Electrical.Analog.Interfaces.TwoPort;
  parameter Real gain(start=1) "Current gain";

equation
  i2 = i1*gain;
  v1 = 0;
end CCC;
