model BackSample
 // Import necessary Modelica libraries
  import Modelica.Blocks.Sources.Sine;
  import Modelica.Clocked.RealSignals.Sampler.SampleClocked;
  import Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock;
  import Modelica.Clocked.RealSignals.Sampler.ShiftSample;
  import Modelica.Clocked.RealSignals.Sampler.BackSample;
  import Modelica.Clocked.Types.Resolution;

  // Components
  Sine sineSignal(f=2, offset=0.1, startTime=0) "Sine wave source";
  PeriodicExactClock periodicClock(factor=20, resolution=Resolution.ms) "Periodic clock with millisecond resolution";
  SampleClocked sample1 "Sampler for clocked signals";
  ShiftSample shiftSample1(shiftCounter=4, resolution=3) "Shift sample block";
  BackSample backSample1(backCounter=4, resolution=3, y_start=0.5) "Back sample block";

equation
  // Connect the sine signal to the sampler, triggered by the periodic clock
  connect(sineSignal.y, sample1.u);
  connect(periodicClock.y, sample1.clock);

  // Connect the sampled output to the shift sample block
  connect(sample1.y, shiftSample1.u);

  // Connect the shifted output to the back sample block
  connect(shiftSample1.y, backSample1.u);
end BackSample;