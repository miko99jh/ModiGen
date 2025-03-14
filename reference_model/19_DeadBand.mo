model DeadBand "Dead-Band"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real uMax(start=1) "Upper limits of dead zones";
  parameter Real uMin=-uMax "Lower limits of dead zones";
  parameter Boolean smoothed = false "Smooth operator is applied" annotation(
    choices(checkBox = true));
 
equation
  assert(uMax >= uMin, "Limits must be consistent");
  if smoothed then
    // The simplified model has no saturation, to make the controller equations linear
    y = homotopy(
      actual = smooth(0, if u < uMin then u - uMin elseif u > uMax then u - uMax else 0),
      simplified = u);  
  else
    // The simplified model has no saturation, to make the controller equations linear
    y = homotopy(
      actual = if u < uMin then u - uMin elseif u > uMax then u - uMax else 0,
      simplified = u);  
  end if;
end DeadBand;
