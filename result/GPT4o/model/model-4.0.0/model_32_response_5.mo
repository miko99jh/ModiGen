model Sample3
 // Import necessary libraries
  import Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock;
  import Modelica.Clocked.Types.Resolution;
  import Modelica.Blocks.Sources.Step;
  import Modelica.Blocks.Math.Gain;
  import Modelica.Blocks.Math.Feedback;
  import Modelica.Clocked.RealSignals.Sampler.Hold;
  import Modelica.Clocked.RealSignals.Sampler.SampleClocked;
  import Modelica.Clocked.RealSignals.Sampler.Sample;

  // Parameters
  parameter Real k = 1.2 "Gain factor for the gain block";
  parameter Real startTime = 0.04 "Start time for the step signal";

  // Components
  PeriodicExactClock periodicClock(factor=20, resolution=Resolution.ms) 
    "Periodic clock with a factor of 20 and millisecond resolution";
  Step step(startTime=startTime) 
    "Step signal source with specified start time";
  Gain gain(k=k) 
    "Gain block with specified gain factor";
  Feedback feedback 
    "Feedback block to compute the difference between two signals";
  Hold hold1 
    "Hold block to convert clocked signal back to continuous-time";
  SampleClocked sample1 
    "Sample block to sample the step signal using the periodic clock";
  Sample sample2 
    "Sample block to sample the output of the hold block";

equation
  // Sampling the step signal using the periodic clock
  sample1.u = step.y;
  sample1.clock = periodicClock.clock;

  // Feedback logic
  feedback.u1 = sample1.y; // Positive input to feedback is the sampled step signal
  feedback.u2 = sample2.y; // Negative input to feedback is the sampled hold output

  // Gain scaling
  gain.u = feedback.y;

  // Signal holding
  hold1.u = gain.y;
  hold1.clock = periodicClock.clock;

  // Sampling the hold output
  sample2.u = hold1.y;
  sample2.clock = periodicClock.clock;

end Sample3;