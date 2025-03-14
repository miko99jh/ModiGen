model SuperSample "Example of a SuperSample block for Integer signals"
   extends Modelica.Icons.Example;

  Modelica.Clocked.IntegerSignals.Sampler.SampleClocked sample1;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(
      factor=20, resolution=Modelica.Clocked.Types.Resolution.ms);
  Modelica.Clocked.IntegerSignals.Sampler.SuperSample superSample1(inferFactor=
        false, factor=3);
  Modelica.Blocks.Sources.IntegerTable table(table=[0,1; 0.05,2; 0.1,0; 0.15,-1;
        0.2,3]);
equation
  connect(periodicClock.y, sample1.clock);
  connect(table.y, sample1.u);
  connect(sample1.y, superSample1.u);
end SuperSample;
