model CCC extends Modelica.Electrical.Analog.Interfaces.TwoPort(V_n=0)
  parameter Real gain=1.0 "Current gain";
  equation 
    i2 = i1 * gain;
    v1 = 0;
end CCC;