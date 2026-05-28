model I
 extends IndustrialControlSystems.Controllers.Interfaces.Block;

  parameter Real T = 1 "Integral time";
  parameter Real y_start = 0 "State initial value";
  parameter Real Ymin = -1e10 "Minimum output limit";
  parameter Real Ymax = 1e10 "Maximum output limit";
  parameter Boolean AntiWindup = true "Anti-windup flag";
  parameter Real eps = 1e-6 "Small positive number for numerical stability";

  input Real u "Input signal";
  input Real tr "Tracking signal";
  input Boolean ts "Tracking signal active";

  output Real y "Output signal";

protected 
  Real Y "Integrator state";

initial equation
  y = y_start;

equation
  if AntiWindup then
    if not ts then
      der(Y) = 1/T * u + 1/eps * (y - Y);
    else
      der(Y) = 1/eps * (y - Y);
    end if;
    y = max(Ymin, min(Ymax, tr));
  else
    Y = 0;
    if not ts then
      T * der(y) = u;
    else
      eps * der(y) = (-y + tr);
    end if;
  end if;
end I;