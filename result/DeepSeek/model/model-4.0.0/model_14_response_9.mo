model Timer_OffDelay
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer(sample = true, sampleTime = 0);
  parameter Real PV = 0 "Periodic Value";
  Boolean run = false "Run";
  Real startTime = 0 "Start Time";
  input Boolean S "Start";
  input Boolean R "Reset";
  output Boolean Q "Output";
  output Real tr "Trigger";
  Boolean Sd(start = false);
equation 
  startTime = if pre(Sd) then pre(startTime) else time;
  run = IndustrialControlSystems.Logical.Timers.Functions.positiveEdge(pre(Sd), Sd, R, pre(startTime), time);
  (run, Q) = IndustrialControlSystems.Logical.Timers.Functions.odt(S, R, PV, time, startTime);
  tr = if not Q then PV - (time - startTime) else PV;
  Sd = S;
end Timer_OffDelay;