model Variant1_unstable
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1;

  // Modify the sensor component to use a sample time of 0.036
  parameter Real sample_time = 0.036;

  // Assuming the sensor component has a parameter for sample time
  ModelicaByExample.Architectures.SensorComparison.Sensor sensor(
    sample_time = sample_time);

  // Additional modifications or components can be added here if needed

end Variant1_unstable;