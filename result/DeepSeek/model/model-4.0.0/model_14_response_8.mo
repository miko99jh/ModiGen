model Timer_OffDelay
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer;
  parameter Real PV = 1 "Preset Value";
  parameter Real Ts = 0.1 "Sampling period";
  Boolean run = false;
  Real startTime = 0;
  input Boolean S;
  input Boolean R;
  output Boolean Q;
  output Real tr;
  Boolean Sd;
equation 
  startTime = 0;
  run = false;
  Sd = S;
  startTime = positiveEdge(pre(Sd), Sd, R, pre(startTime), time);
  (run, Q) = odt(S, R, PV, time, startTime);
  tr = if (not Q) then PV - (time - startTime) else PV;
end Timer_OffDelay;