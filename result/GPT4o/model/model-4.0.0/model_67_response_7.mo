model IdealCore
 extends PartialCore;

  // Parameters for transformation ratios
  parameter Real n12 = 1 "Voltage transformation ratio between winding 1 and winding 2";
  parameter Real n13 = 1 "Voltage transformation ratio between winding 1 and winding 3";

  // Variables for voltages and currents
  Real v1 "Voltage of winding 1";
  Real v2 "Voltage of winding 2";
  Real v3 "Voltage of winding 3";
  Real i1 "Current of winding 1";
  Real i2 "Current of winding 2";
  Real i3 "Current of winding 3";

  // Magnetizing current vector
  Real im[:] = zeros(size(i1)) "Magnetizing current vector set to zero";

equation
  // Voltage transformation equations
  v1 = n12 * v2;
  v1 = n13 * v3;

  // Magnetizing current set to zero
  im = zeros(size(i1));
end IdealCore;