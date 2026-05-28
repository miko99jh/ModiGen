model Variant1_unstable
  extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1;
  parameter Modelica.SIunits.Time sample_time = 0.036;
  ModelicaByExample.Architectures.SensorComparison.Components.Sensor sensor_modified(sample_time=sample_time);
equation
  connect(sensor_modified.measurement, sensor.measurement);
end Variant1_unstable;