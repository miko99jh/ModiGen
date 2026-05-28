model CCC
 extends Modelica.Electrical.Analog.Interfaces.TwoPort
  parameter Real gain=1.0 "Current gain";
  equation 
    v1 = 0; // voltage at the input port is set to zero
    i2 = i1 * gain; // output current is controlled by input current with a linear relationship
  annotation (uses(Modelica(version="3.2.3")))
end CCC;