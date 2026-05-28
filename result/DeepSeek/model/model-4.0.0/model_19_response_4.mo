model DeadBand
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real uMax(start=1) = 1 "Upper limit of the dead zones";
  parameter Real uMin(default=-uMax) = -1 "Lower limit of the dead zones";
  parameter Boolean smoothed(default=false) = false "Indicates whether the smooth operator is applied";
  Modelica.Blocks.Types.PortTypes.inputReal u;
  Modelica.Blocks.Types.PortTypes.outputReal y;
equation 
  assert(uMax >= uMin, "Limits must be consistent");
  y = homotopy(
    actual = if smoothed then smooth(0, if u < uMin then u - uMin elseif u > uMax then u - uMax else 0)
    else if u < uMin then u - uMin elseif u > uMax then u - uMax else 0,
    simplified = u
  );
end DeadBand;