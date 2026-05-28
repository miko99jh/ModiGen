model IdealCore
  extends Modelica.Electrical.Machines.Interfaces.PartialCore;
  parameter Integer n12=1 "Number of turns in winding 1 to winding 2";
  parameter Integer n13=1 "Number of turns in winding 1 to winding 3";
  parameter Real v2 "Voltage in winding 2";
  parameter Real v3 "Voltage in winding 3";
  parameter Integer m=3 "Number of phases";
  Real im[m] "Magnetizing current";
equation 
  im = Modelica.Math.Matrices.zeros(m, 1);
  v1 = n12 * v2;
  v1 = n13 * v3;
end IdealCore;