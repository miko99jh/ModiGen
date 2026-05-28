model TimeBasedSine
 // Import necessary components
  import Modelica.Clocked.RealSignals.Sampler.AssignClock;
  import Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock;
  import Modelica.Clocked.RealSignals.TimeBasedSources.Sine;

  // Declare components
  PeriodicRealClock periodicClock1(period=0.1) "Periodic clock with a period of 0.1 seconds";
  AssignClock assignClock1 "Assign clock to the sine output";
  Sine sine(f=2) "Time-based sine source with frequency 2 Hz";

equation
  // Establish clock assignment logic
  // Use periodicClock1 as the master clock for assignClock1
  assignClock1.clock = periodicClock1.clock;

  // Route the output of the sine generator into assignClock1
  assignClock1.u = sine.y;
end TimeBasedSine;