model Variant2_tuned extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant2
  parameter Real yMax=50;
  parameter Real Ti=0.07;
  parameter Real Td=0.01;
  parameter Real k=4;
  parameter Real uMax=50;
  parameter Real sample_time=0.01;

  ModelicaByExample.Architectures.SensorComparison.Components.Controller controller(yMax=yMax, Ti=Ti, Td=Td, k=k, sample_time=sample_time);
  ModelicaByExample.Architectures.SensorComparison.Components.Actuator actuator(uMax=uMax, sample_time=sample_time);
  ModelicaByExample.Architectures.SensorComparison.Components.Sensor sensor(sample_time=sample_time);

equation
  connect(controller.y, sensor.y);
  connect(actuator.u, controller.u);
end Variant2_tuned;