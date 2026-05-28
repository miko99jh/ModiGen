model Timer_OffDelay
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer;
  parameter Real PV = 0 "Preset Value";
  parameter Real R = 0 "Residual";
  Boolean run = false;
  Real startTime = 0;
  Boolean Sd;
initial equation 
  startTime = 0;
  run = false;
equation 
  Sd = S;
  startTime = sample(0, Ts) * (if pre(Sd) and not Sd then time else pre(startTime));
  (run, Q) = odt(S, R, PV, time, startTime);
  tr = if not Q then PV - (time - startTime) else PV;
end Timer_OffDelay;