model Variant1_unstable
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1;

  // Modify the sensor component to use a specific sample time
  parameter Real sample_time = 0.036 "Sample time for the sensor";

  // Override the sensor component with the new sample time
  ModelicaByExample.Architectures.SensorComparison.Sensor sensor(
    sampleInterval = sample_time);

  // Additional components or modifications can be added here if needed

  annotation(
    uses(Modelica(version = "4.0.0")),
    uses(ModelicaByExample(version = "1.0"))
  );
end Variant1_unstable;