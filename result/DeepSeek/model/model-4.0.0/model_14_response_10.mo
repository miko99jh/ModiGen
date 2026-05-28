model Timer_OffDelay
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer(sample(0,Ts));
  parameter Real PV = 0 "Preset Value";
  Real startTime(start = 0) "Start time of the timer";
  Boolean run(start = false) "Timer is running";
  input Boolean S "Input signal";
  input Boolean R "Reset signal";
  output Boolean Q "Output signal";
  output Real tr "Timer residual time";
equation 
  Sd = S;
  startTime = positiveEdge(pre(Sd), Sd, R, pre(startTime), time);
  (run, Q) = odt(S, R, PV, time, startTime);
  tr = if not Q then PV - (time - startTime) else PV;
end Timer_OffDelay;