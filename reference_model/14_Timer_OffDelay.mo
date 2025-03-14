model Timer_OffDelay1 "OFF delay timer model"
  extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer;
  Boolean run "Flag: true while the timer is counting";
  Real startTime "start time of the timer counting";
  discrete Boolean Sd;
initial equation
  startTime = 0;
  run = false;
equation
  Sd = S;
  when sample(0,Ts) then
    startTime =
      IndustrialControlSystems.Logical.Timers.Functions.positiveEdge(
        pre(Sd),
        Sd,
        R,
        pre(startTime),
        time);
    (run,Q) = IndustrialControlSystems.Logical.Timers.Functions.odt(
        S,
        R,
        PV,
        time,
        startTime);
    tr = if (not Q) then PV - (time - startTime) else PV;
  end when;
end Timer_OffDelay1;
