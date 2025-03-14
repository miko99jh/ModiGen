model BackSample1 "Example of a BackSample block for Real signals"
   extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Sine sine(f=2,
    offset=0.1,
    startTime=0);
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sample1;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(
      factor=20, resolution=Modelica.Clocked.Types.Resolution.ms);
  Modelica.Clocked.RealSignals.Sampler.ShiftSample shiftSample1(
      shiftCounter=4, resolution=3);
  Modelica.Clocked.RealSignals.Sampler.BackSample backSample1(
  backCounter=4,
  resolution=3,
  y_start=0.5);
equation
  connect(sine.y, sample1.u);
  connect(periodicClock.y, sample1.clock);
  connect(sample1.y, shiftSample1.u);
  connect(shiftSample1.y, backSample1.u);
end BackSample1;
