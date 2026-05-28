model Timer_OffDelay
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer;
  parameter Real PV = 1 "Preset Value";
  parameter Real Ts = 1 "Sample time";
  Boolean run = false "Timer is counting";
  Real startTime = 0 "Start time of the timer counting";
  input Boolean S "Start signal";
  input Boolean R "Reset signal";
  output Boolean Q "Output signal";
  Boolean Sd = false;
  Boolean tr;
equation 
  startTime = 0;
  run = false;
  Sd = S;
  when sample(0,Ts) then
    startTime = positiveEdge(pre(Sd), Sd, R, pre(startTime), time);
    (run, Q) = odt(S, R, PV, time, startTime);
    tr = if not Q then PV - (time - startTime) else PV;
  end when;
end Timer_OffDelay;