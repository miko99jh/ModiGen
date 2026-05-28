model OnOffVariant
  extends ModelicaByExample.Architectures.ThermalControl.Examples.ExpandableModel;
  ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator actuator(
    final heating_capacity = 500);
  ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl controller(
    final setpoint = 300);
equation 
  connect(controller.y, actuator.u);
  connect(controller.y, plant.u);
  connect(actuator.u, plant.u);
  connect(controller.y, sensor.u);
  connect(actuator.u, sensor.u);
end OnOffVariant;