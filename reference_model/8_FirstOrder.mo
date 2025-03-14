model FirstOrder "First order process: mu/(1+tau*s)"
  extends IndustrialControlSystems.LinearSystems.Interfaces.BaseBlock;
  parameter Real tau = 2 "|Block parameters| pole's time constant";
  parameter Real mu = 1 "|Block parameters| Gain";
  parameter Real y_start = 0 "|Initial conditions| output initial value";
initial equation
  y = y_start;
equation
  y + tau*der(y) = mu*u;
end FirstOrder;
