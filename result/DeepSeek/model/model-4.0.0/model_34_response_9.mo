model TimeBasedSine
  Modelica.Clocked.RealSignals.Sampler.AssignClock assignClock1;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock1(period=0.1);
  Modelica.Clocked.RealSignals.TimeBasedSources.Sine sine(f=2);
equation
  assignClock1 = sine;
  periodicClock1.clock = assignClock1.clock;
end TimeBasedSine;