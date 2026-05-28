model IdealCore
  extends Modelica.Electrical.Machines.BasicMachines.PartialCore;
  parameter Integer n12 = 1 "Voltage transformation ratio 1 to 2";
  parameter Integer n13 = 1 "Voltage transformation ratio 1 to 3";
  parameter Modelica.SIunits.Current im[m] = zeros(m) "Magnetizing current";
  Modelica.SIunits.Voltage v1[m] = n12 * v2 "Voltage transformation ratio 1 to 2";
  Modelica.SIunits.Voltage v1[m] = n13 * v3 "Voltage transformation ratio 1 to 3";
equation 
  //equations
end IdealCore;