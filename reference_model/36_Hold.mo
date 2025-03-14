model Hold "Example of a Hold block for Boolean signals"
   extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.BooleanTable table(table={0.05,0.15});
  Modelica.Clocked.BooleanSignals.Sampler.SampleClocked sample1;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(
      factor=20, resolution=Modelica.Clocked.Types.Resolution.ms);
  Modelica.Clocked.BooleanSignals.Sampler.Hold hold1(y_start=false);
  Modelica.Clocked.BooleanSignals.Sampler.ShiftSample shiftSample1(shiftCounter=2);
equation
  connect(periodicClock.y, sample1.clock);
  connect(table.y, sample1.u);
  connect(shiftSample1.u, sample1.y);
  connect(hold1.u, shiftSample1.y);
end Hold;
