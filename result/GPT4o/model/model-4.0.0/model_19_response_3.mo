model DeadBand
 extends Modelica.Blocks.Interfaces.SISO;

  parameter Real uMax(start=1) "Upper limit of the dead zones";
  parameter Real uMin = -uMax "Lower limit of the dead zones";
  parameter Boolean smoothed = false "Indicates whether the smooth operator is applied";

equation
  // Ensure that the upper limit is greater than or equal to the lower limit
  assert(uMax >= uMin, "Limits must be consistent");

  if smoothed then
    // Use smooth operator if smoothed is true
    y = homotopy(
      actual = smooth(0, if u < uMin then u - uMin elseif u > uMax then u - uMax else 0),
      simplified = u
    );
  else
    // Direct calculation if smoothed is false
    y = homotopy(
      actual = if u < uMin then u - uMin elseif u > uMax then u - uMax else 0,
      simplified = u
    );
  end if;
end DeadBand;