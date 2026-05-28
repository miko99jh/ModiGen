model I
  extends IndustrialControlSystems.Controllers.Interfaces.Block;
  parameter Real T = 1 "Integral time";
  parameter Real y_start = 0 "State initial value";
  parameter Real Ymin = -inf "Lower limit of integrator output";
  parameter Real Ymax = inf "Upper limit of integrator output";
  parameter Real eps = 1e-3 "Anti-windup gain";
  Real Y(start=y_start) "Integrator state";
equation
  if not AntiWindup or not ts then
    der(Y) = 1/T*u + 1/eps*(Y - y);
    y = max(Ymin, min(Ymax, tr));
  else
    der(Y) = 1/eps*(Y - y);
    y = max(Ymin, min(Ymax, tr));
  end if;
  initial equation
    y = y_start;
end I;