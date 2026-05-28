model Hold
 extends Modelica.Icons.Example;

  // Components
  Modelica.Blocks.Sources.BooleanTable table(
    table={0.05, 0.15}) "Boolean table source";

  Modelica.Clocked.BooleanSignals.Sampler.SampleClocked sample1 "Sampler for clocked Boolean signals";

  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(
    factor=20, 
    resolution=Modelica.Clocked.Types.Resolution.ms) "Periodic clock with specified resolution";

  Modelica.Clocked.BooleanSignals.Sampler.Hold hold1(
    y_start=false) "Hold block for sampled Boolean signal";

  Modelica.Clocked.BooleanSignals.Sampler.ShiftSample shiftSample1(
    shiftCounter=2) "Shift sample block for clocked Boolean signals";

equation
  // Define the clock for sampling
  sample1.clock = periodicClock.clock;

  // Connect the Boolean table to the sampler
  connect(table.y, sample1.u);

  // Connect the sampled signal to the shift sample block
  connect(sample1.y, shiftSample1.u);

  // Connect the shifted signal to the hold block
  connect(shiftSample1.y, hold1.u);

end Hold;