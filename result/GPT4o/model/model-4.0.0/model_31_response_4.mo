model ShiftSample
 // Import necessary Modelica libraries
  import Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock;
  import Modelica.Clocked.ClockSignals.Sampler.ShiftSample;
  import Modelica.Clocked.RealSignals.Sampler.SampleClocked;
  import Modelica.Blocks.Sources.Sine;
  import Modelica.Clocked.Types.Resolution;

  // Components
  PeriodicExactClock periodicClock(factor=20, resolution=Resolution.ms) "Periodic clock with 20 ms period";
  ShiftSample shiftSample1(shiftCounter=4, resolution=3) "Shift sample block with shiftCounter 4 and resolution 3";
  SampleClocked sample1 "Sample clocked block";
  Sine sineSource(frequency=2, offset=0.1, startTime=0) "Sine wave source with frequency 2 Hz, offset 0.1";

equation
  // Connect the periodic clock to the shift sample block
  connect(periodicClock.y, shiftSample1.u);

  // Use the shifted clock signal to drive the sample clocked block
  connect(shiftSample1.y, sample1.clock);

  // Sample the continuous output of the sine source
  connect(sineSource.y, sample1.u);

  // Output the sampled signal
  // You can add an output connector if needed, for example:
  // output Real sampledSignal;
  // connect(sample1.y, sampledSignal);

end ShiftSample;