model Test_SampleAndHold
  parameter Real sample_time=0.25;
  ModelicaByExample.DiscreteBehavior.SpeedMeasurement.SampleAndHold sampleAndHold(
    sample_time = sample_time);
end Test_SampleAndHold;
