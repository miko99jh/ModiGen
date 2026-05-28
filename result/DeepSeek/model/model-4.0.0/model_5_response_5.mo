model I
  extends IndustrialControlSystems.Controllers.Interfaces.Block;
  parameter Real T = 1 "Integral time";
  parameter Real y_start = 0 "State initial value";
  parameter Real Ymin = -Inf "Lower output limit";
  parameter Real Ymax = Inf "Upper output limit";
  parameter Real eps = 1e-4 "Anti-windup parameter";
  Real Y(start=y_start) "State variable";
equation 
  // Anti-windup
  if AntiWindup and not ts then
    der(Y) = 1/T*u + 1/eps*(Y - y);
    y = max(Ymin,min(Ymax,tr));
  elseif AntiWindup and ts then
    der(Y) = 1/eps*(Y - y);
    y = max(Ymin,min(Ymax,tr));
  elseif not AntiWindup then
    Y = 0;
    der(y) = if not ts then T*u else eps*(-y + tr);
    y = if not ts then u else tr;
  end if;
  // Initial equation
  y = y_start;
end I;