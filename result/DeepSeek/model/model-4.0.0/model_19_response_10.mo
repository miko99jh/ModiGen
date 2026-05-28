model DeadBand
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real uMax(start=1) "Upper limit of the dead zones";
  parameter Real uMin(default=-uMax) "Lower limit of the dead zones";
  parameter Boolean smoothed(default=false) "Indicates whether the smooth operator is applied";

  Modelica.Blocks.Types.SmoothingMethod smoothMethod = Modelica.Blocks.Types.SmoothingMethod.None;

  Modelica.Blocks.Interfaces.RealInput u "Input signal";
  Modelica.Blocks.Interfaces.RealOutput y "Output signal";

equation
  assert(uMax >= uMin, "Limits must be consistent");

  if smoothed then
    y = homotopy(actual = smooth(smoothMethod, if u < uMin then u - uMin elseif u > uMax then u - uMax else 0), simplified = u);
  else
    y = homotopy(actual = if u < uMin then u - uMin elseif u > uMax then u - uMax else 0, simplified = u);
  end if;
end DeadBand;