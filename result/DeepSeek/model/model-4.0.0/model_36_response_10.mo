model Hold
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.BooleanTable table;
  Modelica.Clocked.BooleanSignals.Sampler.SampleClocked sample1;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock;
  Modelica.Clocked.BooleanSignals.Sampler.Hold hold1;
  Modelica.Clocked.BooleanSignals.Sampler.ShiftSample shiftSample1;
equation 
  // Clocking & Sampling
  periodicClock.f = 20;
  periodicClock.resolution = Modelica.Clocked.Types.Resolution.ms;
  sample1.u = table.y;
  sample1.clock = periodicClock.y;
  // Signal Delay
  shiftSample1.u = sample1.y;
  shiftSample1.shiftCounter = 2;
  // Re-conversion
  hold1.y_start = false;
  hold1.u = shiftSample1.y;
end Hold;