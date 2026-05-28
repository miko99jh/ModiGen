model Timer_OffDelay
 extends IndustrialControlSystems.Logical.Timers.Interfaces.BaseResidualTimer;

  // Parameters
  parameter Real PV "Preset value for the timer";
  parameter Real Ts "Sampling time";

  // Variables
  Boolean run(start=false) "True while the timer is counting";
  Real startTime(start=0) "Start time of the timer counting";
  discrete Boolean Sd "Discrete signal";

initial equation
  startTime = 0;
  run = false;

equation
  // Sd equals S
  Sd = S;

  // Sample function to trigger the timer
  when sample(0, Ts) then
    // Set startTime using positiveEdge function
    startTime = IndustrialControlSystems.Logical.Timers.Functions.positiveEdge(pre(Sd), Sd, R, pre(startTime), time);

    // Determine run and Q using odt function
    (run, Q) = IndustrialControlSystems.Logical.Timers.Functions.odt(S, R, PV, time, startTime);

    // Calculate tr
    tr = if not Q then PV - (time - startTime) else PV;
  end when;
end Timer_OffDelay;