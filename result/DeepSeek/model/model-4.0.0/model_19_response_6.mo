model DeadBand
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real uMax(start=1) = "Upper limit of the dead zones";
  parameter Real uMin(default=-uMax) = "Lower limit of the dead zones";
  parameter Boolean smoothed(default=false) = "Indicates whether the smooth operator is applied";

  Modelica.Blocks.Types.RealOutput y(fixed=true) "Output signal";

equation 
  assert(uMax >= uMin, "Limits must be consistent");

  if smoothed then
    y = homotopy(actual = smooth(0, if u < uMin then u - uMin elseif u > uMax then u - uMax else 0), simplified = u);
  else
    y = homotopy(actual = if u < uMin then u - uMin elseif u > uMax then u - uMax else 0, simplified = u);
  end if;
end DeadBand;