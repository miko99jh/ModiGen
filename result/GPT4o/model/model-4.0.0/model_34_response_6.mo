model TimeBasedSine
 // Import necessary Modelica packages
  import Modelica.Clocked.RealSignals.Sampler.AssignClock;
  import Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock;
  import Modelica.Clocked.RealSignals.TimeBasedSources.Sine;

  // Declare components
  PeriodicRealClock periodicClock1(period=0.1) "Periodic clock with a period of 0.1 seconds";
  AssignClock assignClock1 "Assign clock to the signal";
  Sine sine(f=2) "Time-based sine source with frequency 2 Hz";

equation
  // Establish clock assignment logic
  connect(periodicClock1.y, assignClock1.clock) "Use periodicClock1 as the master timing source";
  connect(sine.y, assignClock1.u) "Route the output of the sine generator into assignClock1";
end TimeBasedSine;