model I
 extends IndustrialControlSystems.Controllers.Interfaces.Block;

  // Parameters
  parameter Real T = 1 "Integral time";
  parameter Real y_start = 0 "State initial value";
  parameter Boolean AntiWindup = true "Flag for anti-windup functionality";
  parameter Real eps = 1e-6 "Small positive value for numerical stability";
  parameter Real Ymin = -1e10 "Minimum output limit";
  parameter Real Ymax = 1e10 "Maximum output limit";

  // Inputs
  input Real u "Input signal";
  input Real tr "Tracking signal";
  input Boolean ts "Tracking signal active";

  // Outputs
  output Real y "Output signal";

  // Protected variables
  protected
  Real Y "Internal state variable";

initial equation
  y = y_start;

equation
  if AntiWindup then
    if not ts then
      der(Y) = 1/T*u + 1/eps*(y - Y);
      y = max(Ymin, min(Ymax, tr));
    else
      der(Y) = 1/eps*(y - Y);
      y = max(Ymin, min(Ymax, tr));
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