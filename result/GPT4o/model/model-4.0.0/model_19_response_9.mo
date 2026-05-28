model DeadBand
 extends Modelica.Blocks.Interfaces.SISO; // Inherit SISO interface

  // Parameters
  parameter Real uMax(start=1) "Upper limit of the dead zones";
  parameter Real uMin = -uMax "Lower limit of the dead zones (default is -uMax)";
  parameter Boolean smoothed = false "Enable smooth operator";

  // Variables
  Real y "Output signal";

equation
  // Ensure consistency of limits
  assert(uMax >= uMin, "Limits must be consistent");

  // Dead-band functionality
  if smoothed then
    y = homotopy(
      actual = smooth(0, if u < uMin then u - uMin elseif u > uMax then u - uMax else 0),
      simplified = u
    );
  else
    y = homotopy(
      actual = if u < uMin then u - uMin elseif u > uMax then u - uMax else 0,
      simplified = u
    );
  end if;

end DeadBand;