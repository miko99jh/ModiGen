model Variant1_unstable
  extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1;
equation
  // Override the sample time in the sensor component
  sensor.sample_time = 0.036;
end Variant1_unstable;