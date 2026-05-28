model IdealCore
  extends Modelica.Electrical.Machines.Interfaces.PartialCore;
  parameter Real n12 "Voltage transformation ratio 1 to 2";
  parameter Real n13 "Voltage transformation ratio 1 to 3";

  parameter Integer m = Modelica.Electrical.Machines.Utilities.getNumberOfPhases(windingSet.phases);
  parameter Real im[m] = zeros(m);

equation 
  // magnetizing current
  im = zeros(m);

  // voltage transformation ratios
  v1 = n12 * v2;
  v1 = n13 * v3;
end IdealCore;