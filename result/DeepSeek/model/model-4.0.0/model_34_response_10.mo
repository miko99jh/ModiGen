model TimeBasedSine
  Modelica.Clocked.RealSignals.Sampler.AssignClock assignClock1(final clock=periodicClock1);
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock1(final period=0.1);
  Modelica.Clocked.RealSignals.TimeBasedSources.Sine sine(final f=2, final clock=assignClock1);
equation 
  assignClock1.y = sine.y;
end TimeBasedSine;