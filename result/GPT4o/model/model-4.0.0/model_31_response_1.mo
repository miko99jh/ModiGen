model ShiftSample
 // Import necessary libraries
  import Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock;
  import Modelica.Clocked.ClockSignals.Sampler.ShiftSample;
  import Modelica.Clocked.RealSignals.Sampler.SampleClocked;
  import Modelica.Blocks.Sources.Sine;

  // Components
  PeriodicExactClock periodicClock(
    factor=20, 
    resolution=Modelica.Clocked.Types.Resolution.ms) 
    "Periodic clock with a factor of 20 and millisecond resolution";

  ShiftSample shiftSample1(
    shiftCounter=4, 
    resolution=3) 
    "ShiftSample block with shiftCounter=4 and resolution=3";

  SampleClocked sample1 
    "SampleClocked block to sample the sine wave";

  Sine sine1(
    frequency=2, 
    offset=0.1, 
    startTime=0) 
    "Sine wave source with frequency=2 Hz, offset=0.1, and startTime=0";

equation 
  // Connect the periodic clock to the ShiftSample block
  connect(periodicClock.y, shiftSample1.u) 
    "Connect periodic clock output to ShiftSample input";

  // Connect the shifted clock signal to the SampleClocked block
  connect(shiftSample1.y, sample1.clock) 
    "Connect shifted clock output to SampleClocked clock input";

  // Connect the sine wave output to the SampleClocked input
  connect(sine1.y, sample1.u) 
    "Connect sine wave output to SampleClocked input";

end ShiftSample;