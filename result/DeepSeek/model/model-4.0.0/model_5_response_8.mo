model I
  extends IndustrialControlSystems.Controllers.Interfaces.Block;
  parameter Real T = 1 "Integral time";
  parameter Real y_start = 0 "State initial value";
  parameter Real Ymin = -inf "Lower limit for output";
  parameter Real Ymax = inf "Upper limit for output";
  parameter Real eps = 1e-3 "Anti-windup parameter";
  Real Y(start=y_start) "State variable";
equation 
  der(Y) = if not AntiWindup then
    if ts then
      eps * (y - Y)
    else
      1/T * u
  else if ts then
    1/eps * (y - Y)
  else
    1/T * u + 1/eps * (y - Y);
  y = max(Ymin, min(Ymax, tr));
  Y = y;
end I;