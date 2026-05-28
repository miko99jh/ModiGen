model TimeBasedSine
  Modelica.Clocked.RealSignals.Sampler.AssignClock assignClock1(clock=periodicClock1);
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock1(period=0.1);
  Modelica.Clocked.RealSignals.TimeBasedSources.Sine sine(f=2, clock=assignClock1.clock);
equation
  assignClock1.y = sine.y;
end TimeBasedSine;