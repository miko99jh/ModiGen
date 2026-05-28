model Variant1_unstable
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1;

  // Modify the sensor component to use a specific sample time
  parameter Real sample_time = 0.036 "Sample time for the sensor";

  // Override the sensor component with the new sample time
  ModelicaByExample.Architectures.SensorComparison.Sensor sensor(
    sampleTime = sample_time);

  // Additional modifications or components can be added here if needed

end Variant1_unstable;