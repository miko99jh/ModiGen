model Hold
 extends Modelica.Icons.Example;

  // Components
  Modelica.Blocks.Sources.BooleanTable table(
    table=[0.05, 0.15]) "Boolean table source providing input values";

  Modelica.Clocked.BooleanSignals.Sampler.SampleClocked sample1
    "Sampler for clocked Boolean signals";

  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(
    factor=20, 
    resolution=Modelica.Clocked.Types.Resolution.ms) 
    "Periodic clock with specified factor and resolution";

  Modelica.Clocked.BooleanSignals.Sampler.Hold hold1(
    y_start=false) 
    "Hold block to convert clocked signal back to continuous-time";

  Modelica.Clocked.BooleanSignals.Sampler.ShiftSample shiftSample1(
    shiftCounter=2) 
    "ShiftSample block to apply sample shift";

equation
  // Establishing the topology
  connect(periodicClock.y, sample1.clock) 
    "Connect periodic clock to sample1 for timing";

  connect(table.y, sample1.u) 
    "Connect Boolean table output to sample1 input";

  connect(sample1.y, shiftSample1.u) 
    "Connect sampled output to shiftSample1 input";

  connect(shiftSample1.y, hold1.u) 
    "Connect shifted output to hold1 input";

end Hold;