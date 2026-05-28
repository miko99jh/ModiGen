model IdealCore
 extends PartialCore;

  // Parameters for the transformation ratios
  parameter Real n12 "Voltage transformation ratio between winding 1 and 2";
  parameter Real n13 "Voltage transformation ratio between winding 1 and 3";

  // Variables for the voltages and currents of the windings
  Real v1 "Voltage across winding 1";
  Real v2 "Voltage across winding 2";
  Real v3 "Voltage across winding 3";
  Real im[:] "Magnetizing current vector";

equation
  // Set the magnetizing current to zero for all phases
  im = zeros(size(im));

  // Define the voltage transformation relationships
  v1 = n12 * v2;
  v1 = n13 * v3;

end IdealCore;