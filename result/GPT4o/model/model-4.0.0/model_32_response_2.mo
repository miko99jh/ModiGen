model Sample3
 // Import necessary Modelica libraries
  import Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock;
  import Modelica.Clocked.Types.Resolution;
  import Modelica.Blocks.Sources.Step;
  import Modelica.Blocks.Math.Gain;
  import Modelica.Blocks.Math.Feedback;
  import Modelica.Clocked.RealSignals.Sampler.Hold;
  import Modelica.Clocked.RealSignals.Sampler.SampleClocked;
  import Modelica.Clocked.RealSignals.Sampler.Sample;

  // Parameters
  parameter Real factor = 20;
  parameter Resolution resolution = Resolution.ms;

  // Components
  PeriodicExactClock periodicClock(factor=factor, resolution=resolution);
  Step step(startTime=0.04);
  Gain gain(k=1.2);
  Feedback feedback;
  Hold hold1;
  SampleClocked sample1(clock=periodicClock);
  Sample sample2;

equation
  // Sampling the step signal using sample1 triggered by periodicClock
  sample1.u = step.y;
  
  // Feedback logic: sample1 output enters the positive input of feedback
  feedback.u1 = sample1.y;
  
  // Scale feedback output using gain
  gain.u = feedback.y;
  
  // Signal holding: route gain output through hold1
  hold1.u = gain.y;
  
  // Sample the output of hold1 using sample2
  sample2.u = hold1.y;
  
  // Connect sample2 output to the negative input of feedback to close the loop
  feedback.u2 = sample2.y;
  
end Sample3;