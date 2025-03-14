model TimeBasedSine1
  "Example of using the clocked time based Sine source block"
   extends Modelica.Icons.Example;
  Modelica.Clocked.RealSignals.Sampler.AssignClock assignClock1;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock
    periodicClock1(period=0.1);
  Modelica.Clocked.RealSignals.TimeBasedSources.Sine sine(f=2);
equation
  connect(periodicClock1.y, assignClock1.clock);
  connect(sine.y, assignClock1.u);
end TimeBasedSine1;
