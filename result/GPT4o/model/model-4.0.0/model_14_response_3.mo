model Timer_OffDelay
 extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer;

  // Parameters
  parameter Real Ts = 0.1 "Sample time";
  parameter Real PV = 10.0 "Preset value for the timer";

  // Variables
  Boolean run(start=false) "True while the timer is counting";
  Real startTime(start=0) "Start time of the timer counting";
  discrete Boolean Sd "Discrete signal";

initial equation
  startTime = 0;
  run = false;

equation
  Sd = S;

  when sample(0, Ts) then
    startTime = IndustrialControlSystems.Logical.Timers.Functions.positiveEdge(pre(Sd), Sd, R, pre(startTime), time);
    (run, Q) = IndustrialControlSystems.Logical.Timers.Functions.odt(S, R, PV, time, startTime);
    tr = if not Q then PV - (time - startTime) else PV;
  end when;

end Timer_OffDelay;