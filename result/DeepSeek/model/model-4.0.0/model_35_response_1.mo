model SuperSample
  extends Modelica.Icons.Example;
  Modelica.Clocked.IntegerSignals.Sampler.SampleClocked sample1;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock;
  Modelica.Clocked.IntegerSignals.Sampler.SuperSample superSample1;
  Modelica.Blocks.Sources.IntegerTable table;
equation 
  periodicClock.f = 20;
  periodicClock.resolution = Modelica.Clocked.Types.Resolution.ms;
  sample1.u = table.y;
  sample1.clock = periodicClock.clock;
  superSample1.u = sample1.y;
  superSample1.inferFactor = false;
  superSample1.factor = 3;
end SuperSample;