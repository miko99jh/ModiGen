model Hold
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.BooleanTable table(table={0.05, 0.15});
  Modelica.Clocked.BooleanSignals.Sampler.SampleClocked sample1;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(factor=20, resolution=Modelica.Clocked.Types.Resolution.ms);
  Modelica.Clocked.BooleanSignals.Sampler.Hold hold1(y_start=false);
  Modelica.Clocked.BooleanSignals.Sampler.ShiftSample shiftSample1(shiftCounter=2);
equation 
  connect(table.y, sample1.u);
  connect(periodicClock.y, sample1.clock);
  connect(sample1.y, shiftSample1.u);
  connect(shiftSample1.y, hold1.u);
  connect(hold1.y, periodicClock.trigger);
end Hold;