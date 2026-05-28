model IdealCore
 extends PartialCore;

  parameter Integer m = 3 "Number of phases";
  parameter Real n12 "Voltage transformation ratio between winding 1 and winding 2";
  parameter Real n13 "Voltage transformation ratio between winding 1 and winding 3";

  // Declare the magnetizing current vector
  Real im[m];

equation
  // Set the magnetizing current vector to zero for all m phases
  im = zeros(m);

  // Define the voltage transformation ratios
  for i in 1:m loop
    v1[i] = n12 * v2[i];
    v1[i] = n13 * v3[i];
  end for;

end IdealCore;