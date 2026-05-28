model Variant2_tuned
  extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant2;

  // redefine controller with tuned parameters
  Modelica.Blocks.Continuous.PID controller(
    yMax = 50,
    Ti = 0.07,
    Td = 0.01,
    k = 4
  ) extends controller;

  // redefine actuator with tuned parameters
  Modelica.Blocks.Interfaces.RealInput uMax(start = 50) extends actuator.uMax;

  // redefine sensor with tuned parameters
  Modelica.Blocks.Interfaces.RealOutput sample_time(start = 0.01) extends sensor.sample_time;

end Variant2_tuned;