model TimeBasedSine
 // Clock source: periodic clock with a period of 0.1 seconds
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock1(period=0.1);

  // Clock assignment block
  Modelica.Clocked.RealSignals.Sampler.AssignClock assignClock1;

  // Time-based sine source block with frequency f=2 Hz
  Modelica.Clocked.RealSignals.TimeBasedSources.Sine sine(f=2);

equation
  // Assign the periodic clock as the master timing source for the assignClock1 block
  assignClock1.clock = periodicClock1.clock;

  // Route the output of the sine generator into the assignClock1 block
  assignClock1.u = sine.y;

end TimeBasedSine;