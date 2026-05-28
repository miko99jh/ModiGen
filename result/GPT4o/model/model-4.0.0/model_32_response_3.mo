model Sample3
 // Import necessary Modelica libraries
  import Modelica.Blocks.Sources.Step;
  import Modelica.Blocks.Math.Gain;
  import Modelica.Blocks.Math.Feedback;
  import Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock;
  import Modelica.Clocked.RealSignals.Sampler.Hold;
  import Modelica.Clocked.RealSignals.Sampler.SampleClocked;
  import Modelica.Clocked.RealSignals.Sampler.Sample;
  import Modelica.Clocked.Types.Resolution;

  // Parameters
  parameter Integer factor = 20;
  parameter Resolution resolution = Resolution.ms;

  // Components
  PeriodicExactClock periodicClock(factor = factor, resolution = resolution);
  Step step(startTime = 0.04);
  Gain gain(k = 1.2);
  Feedback feedback;
  Hold hold1;
  SampleClocked sample1;
  Sample sample2;

equation
  // Sampling: Use 'periodicClock' to trigger the sampling of the 'step' signal via 'sample1'
  connect(periodicClock.y, sample1.clock);
  connect(step.y, sample1.u);

  // Feedback Logic: The output of 'sample1' enters the positive input ('u1') of the 'feedback' block
  connect(sample1.y, feedback.u1);

  // The 'feedback' output is then scaled by the gain
  connect(feedback.y, gain.u);

  // Signal Holding: Route the 'gain' output through 'hold1' to convert it back for sampling
  connect(gain.y, hold1.u);

  // Loop Closure: Sample the output of 'hold1' using 'sample2'
  connect(hold1.y, sample2.u);
  connect(periodicClock.y, sample2.clock);

  // Connect the output of 'sample2' to the negative input ('u2') of the 'feedback' block to close the loop
  connect(sample2.y, feedback.u2);

end Sample3;