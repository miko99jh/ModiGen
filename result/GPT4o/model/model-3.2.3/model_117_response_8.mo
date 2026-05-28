model Variant1_unstable
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1;

  // Modify the sensor component to use a specific sample time
  parameter Real sample_time = 0.036 "Sample time for the sensor";

  // Override the sensor component with the new sample time
  ModelicaByExample.Architectures.SensorComparison.Sensor sensor(
    sampleInterval = sample_time);

  // Additional components or modifications can be added here if needed

  annotation(
    uses(ModelicaByExample(version="1.0")),
    Documentation(info="<html>
      <p>This model simulates an unstable scenario by using a sample interval of 0.036 seconds for the sensor component.</p>
      <p>It extends the Variant1 model from the SensorComparison examples in ModelicaByExample.</p>
      </html>")
  );
end Variant1_unstable;