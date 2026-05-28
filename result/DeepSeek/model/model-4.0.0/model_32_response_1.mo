model Sample3
  extends Modelica.Icons.Example;
  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(factor=20, resolution=Modelica.Clocked.Types.Resolution.ms);
  Modelica.Blocks.Sources.Step step(startTime=0.04);
  Modelica.Blocks.Math.Gain gain(k=1.2);
  Modelica.Blocks.Math.Feedback feedback;
  Modelica.Clocked.RealSignals.Sampler.Hold hold1;
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sample1;
  Modelica.Clocked.RealSignals.Sampler.Sample sample2;
equation 
  sample1.y = step.y;
  feedback.u1 = sample1.y;
  feedback.y = gain.y;
  hold1.y = feedback.y;
  sample2.y = hold1.y;
  feedback.u2 = sample2.y;
end Sample3;