model Sample3
  extends Modelica.Blocks.Examples.Contents.Sample;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(factor=20, resolution=Modelica.Clocked.Types.Resolution.ms);
  Modelica.Blocks.Sources.Step step(startTime=0.04);
  Modelica.Blocks.Math.Gain gain(k=1.2);
  Modelica.Blocks.Math.Feedback feedback;
  Modelica.Clocked.RealSignals.Sampler.Hold hold1;
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sample1;
  Modelica.Clocked.RealSignals.Sampler.Sample sample2;
equation 
  sample1.u = step.y;
  feedback.u1 = sample1.y;
  sample2.u = gain.y;
  feedback.u2 = sample2.y;
  hold1.u = feedback.y;
  sample1.clock = periodicClock.y;
  sample2.clock = periodicClock.y;
end Sample3;