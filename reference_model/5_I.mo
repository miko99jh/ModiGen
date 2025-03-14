model I "Integrator with tracking mode (and limiter)"
  extends IndustrialControlSystems.Controllers.Interfaces.Block;
  parameter Real T = 1 "Integral time" annotation(Evaluate = true);
  parameter Real y_start = 0 "State initial value" annotation(Evaluate = true);
protected
  Real Y;
initial equation
  y = y_start;
equation
  if AntiWindup then
    if not ts then
      der(Y) = 1/T*u + 1/eps*(y - Y);
      y = max(Ymin,min(Ymax,Y));
    else
      der(Y) = 1/eps*(y - Y);
      y = max(Ymin,min(Ymax,tr));
    end if;

  else
    Y = 0;
    if not ts then
      T*der(y) = u;
    else
      eps*der(y) = (-y + tr);
    end if;
  end if;
end I;
