model Variant2_tuned
  extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant2;

  // Redefine the actuator with a new sample_time
  replaceable actuator actuator(
    final uMax = 50,
    sample_time = 0.01
  );

  // Redefine the controller with new parameters
  replaceable controller controller(
    final yMax = 50,
    final Ti = 0.07,
    final Td = 0.01,
    final k = 4
  );

  // Redefine the sensor with a new sample_time
  replaceable sensor sensor(
    sample_time = 0.01
  );
end Variant2_tuned;