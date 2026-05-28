model I
  extends IndustrialControlSystems.Controllers.Interfaces.Block;
  parameter Real T = 1 "Integral time";
  parameter Real y_start = 0 "State initial value";
  parameter Real Ymin = -inf "Minimum output value";
  parameter Real Ymax = inf "Maximum output value";
  parameter Real eps = 1e-3 "Anti-windup gain";
  Real Y(start=y_start) "Integrator state";
equation 
  der(Y) = if AntiWindup and not ts then 
              1/T*u + 1/eps*(Y - y) 
            elseif AntiWindup and ts then 
              1/eps*(Y - y) 
            else 
              0 
            end if;
  y = max(Ymin,min(Ymax,tr));
  y = Y;
initial equation 
  Y = y_start;
end I;