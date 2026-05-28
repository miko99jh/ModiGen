model Variant1_unstable
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1;

  parameter Real sample_time = 0.036 "Sample time for the sensor";

  // Modify the sensor component to use the specified sample_time
  ModelicaByExample.Architectures.SensorComparison.Sensor sensor(
    sampleInterval=sample_time);

  // Additional modifications or components can be added here if needed

end Variant1_unstable;