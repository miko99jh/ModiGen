model Sample3
  "Example of a Sample block for Real signals with direct feed-through in the continuous-time and the clocked partition"
 extends Modelica.Icons.Example;
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sample1;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(
      factor=20, resolution=Modelica.Clocked.Types.Resolution.ms);
  Modelica.Blocks.Sources.Step step(startTime=0.04);
  Modelica.Blocks.Math.Gain gain(k=1.2);
  Modelica.Clocked.RealSignals.Sampler.Hold hold1;
  Modelica.Blocks.Math.Feedback feedback;
  Modelica.Clocked.RealSignals.Sampler.Sample sample2;
equation
  connect(step.y, sample1.u);
  connect(gain.y, hold1.u);
  connect(feedback.y, gain.u);
  connect(sample2.y, feedback.u2);
  connect(periodicClock.y, sample1.clock);
  connect(sample1.y, feedback.u1);
  connect(hold1.y, sample2.u);
end Sample3;
