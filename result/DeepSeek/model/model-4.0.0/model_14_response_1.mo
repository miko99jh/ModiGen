model Timer_OffDelay
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer(sample(0,Ts));
  parameter Real PV = 0 "Preset Value";
  parameter Real R = 0.1 "Residual value";
  Boolean run = false "True while the timer is counting";
  Real startTime = 0 "Start time of the timer counting";
  input Boolean S "Input signal";
  output Boolean Q "Output signal";
  Boolean Sd = false;
  equation 
    Sd = S;
    startTime = positiveEdge(pre(Sd), Sd, R, pre(startTime), time);
    (run, Q) = odt(S, R, PV, time, startTime);
    tr = if (not Q) then PV - (time - startTime) else PV;
  initial equation 
    startTime = 0;
    run = false;
end Timer_OffDelay;