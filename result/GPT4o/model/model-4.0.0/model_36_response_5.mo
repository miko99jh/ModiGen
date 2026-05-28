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
    shiftCounter=2) "Shift sample block with specified shift counter";

equation
  // Establishing the topology
  connect(table.y, sample1.u) "Connect table output to sampler input";
  connect(periodicClock.y, sample1.clock) "Connect periodic clock to sampler clock input";
  connect(sample1.y, shiftSample1.u) "Connect sampler output to shift sample input";
  connect(shiftSample1.y, hold1.u) "Connect shifted sample output to hold input";

end Hold;