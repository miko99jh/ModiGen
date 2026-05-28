model Variant1_unstable
  extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1;
  parameter Real sample_time = 0.036;
  replaceable model sensor = ModelicaByExample.Architectures.SensorComparison.Components.Sensor(sample_time = sample_time);
end Variant1_unstable;