model Timer_OffDelay
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer(sample(0,Ts));
  parameter Real PV = 0 "Preset value";
  parameter Real R = 0.1 "Residual time";
  Boolean run;
  Real startTime;
  Boolean Sd;
initial equation 
  startTime = 0;
  run = false;
equation 
  Sd = S;
  startTime = positiveEdge(pre(Sd), Sd, R, pre(startTime), time);
  (run, Q) = odt(S, R, PV, time, startTime);
  tr = if (not Q) then PV - (time - startTime) else PV;
end Timer_OffDelay;