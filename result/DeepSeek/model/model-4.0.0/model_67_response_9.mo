model IdealCore
  extends Modelica.Electrical.Machines.Interfaces.PartialCore;
  parameter Integer m=3 "Number of phases";
  parameter Real n12=1 "Voltage transformation ratio from winding 1 to winding 2";
  parameter Real n13=1 "Voltage transformation ratio from winding 1 to winding 3";
  parameter Real v2[m] "Voltage in winding 2";
  parameter Real v3[m] "Voltage in winding 3";
  parameter Real im[m] "Magnetizing current";
  parameter Real i1[m] "Current in winding 1";
  parameter Real i2[m] "Current in winding 2";
  parameter Real i3[m] "Current in winding 3";
  Real im[m] = zeros(m) "Magnetizing current";
equation 
  v1 = n12 * v2;
  v1 = n13 * v3;
  i1 = i2 + i3;
end IdealCore;