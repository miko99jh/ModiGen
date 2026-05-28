model DeadBand
 extends Modelica.Blocks.Interfaces.SISO;

  parameter Real uMax(start=1) "Upper limit of the dead zones";
  parameter Real uMin = -uMax "Lower limit of the dead zones";
  parameter Boolean smoothed = false "Enable smooth operator";

equation
  // Ensure the limits are consistent
  assert(uMax >= uMin, "Limits must be consistent");

  // Dead-band functionality with optional smoothing
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