model I
  extends IndustrialControlSystems.Controllers.Interfaces.Block;
  parameter Real T = 1 "Integral time";
  parameter Real y_start = 0 "State initial value";
  parameter Real Ymin = -inf "Minimum output value";
  parameter Real Ymax = inf "Maximum output value";
  parameter Real eps = 1e-3 "Anti-windup parameter";
  Real Y(start=y_start) "Integrator state";
equation 
  der(Y) = if not AntiWindup then 
    if not ts then T*der(y) else eps*der(y) 
  else 
    if not ts then 
      1/T*u + 1/eps*(y - Y) 
    else 
      1/eps*(y - Y)
  ;
  y = max(Ymin,min(Ymax,tr));
  initial equation 
    y = y_start;
end I;