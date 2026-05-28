model I
  extends IndustrialControlSystems.Controllers.Interfaces.Block;
  parameter Real T = 1 "Integral time";
  parameter Real y_start = 0 "State initial value";
  parameter Real Ymin = -Inf "Minimum output";
  parameter Real Ymax = Inf "Maximum output";
  parameter Real eps = 1e-6 "Anti-windup parameter";
  Real Y(start=y_start) "Integrator state";
equation 
  der(Y) = if not AntiWindup then 
    if not ts then 
      T*der(y) 
    else 
      eps*der(y) 
  else if ts then 
    if not ts then 
      1/T*u + 1/eps*(y - Y) 
    else 
      1/eps*(y - Y) 
  end if;
  y = max(Ymin,min(Ymax,tr));
  y = Y;
end I;