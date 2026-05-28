model Timer_OffDelay
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer;
  Boolean run = false;
  Real startTime = 0;
  input Boolean S;
  input Boolean R;
  input Real PV;
  output Boolean Q = false;
  output Real tr = 0;
  discrete Boolean Sd = false;
equation 
  startTime = 0;
  run = false;
  Sd = S;
  startTime = positiveEdge(pre(Sd), Sd, R, pre(startTime), time);
  (run, Q) = odt(S, R, PV, time, startTime);
  tr = if not Q then PV - (time - startTime) else PV;
end Timer_OffDelay;