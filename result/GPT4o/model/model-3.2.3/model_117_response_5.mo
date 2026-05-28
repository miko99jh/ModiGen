model Variant1_unstable
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1;

  // Modify the sensor component to use a specific sample time
  parameter Real sample_time = 0.036;

  // Override the sensor component with the new sample time
  ModelicaByExample.Architectures.SensorComparison.Sensor sensor(
    sampleInterval=sample_time);

  // Additional components or modifications can be added here if needed

  // Documentation or annotations can be added here
  annotation(
    Documentation(info="This model simulates an unstable scenario by using a sample interval of 0.036 for the sensor component.")
  );
end Variant1_unstable;