model Timer_OffDelay
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer(
    parameter Real PV = 0,
    parameter Real R = 0.01,
    parameter Real Ts = 0.1);

  Boolean run = false;
  Real startTime = 0;
  Boolean Sd = false;

  equation 
    startTime = 0;
    run = false;

    Sd = S;

    startTime = positiveEdge(pre(Sd), Sd, R, pre(startTime), time);
    [run, Q] = odt(S, R, PV, time, startTime);
    tr = if (not Q) then PV - (time - startTime) else PV;
end Timer_OffDelay;