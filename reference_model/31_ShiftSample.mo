model ShiftSample "Example of a ShiftSample block for Clock signals"
   extends Modelica.Icons.Example;

  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(
      factor=20, resolution=Modelica.Clocked.Types.Resolution.ms);
  Modelica.Clocked.ClockSignals.Sampler.ShiftSample shiftSample1(shiftCounter=4,
      resolution=3);
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sample1;
  Modelica.Blocks.Sources.Sine sine(f=2,
    offset=0.1,
    startTime=0);
equation
  connect(periodicClock.y, shiftSample1.u);
  connect(sine.y, sample1.u);
  connect(shiftSample1.y, sample1.clock);
end ShiftSample;
