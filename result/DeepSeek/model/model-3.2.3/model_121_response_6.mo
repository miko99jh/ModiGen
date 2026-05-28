model OnOffVariant
  extends ModelicaByExample.Architectures.ThermalControl.Examples.ExpandableModel;
  replaceable ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator actuator(
    final heating_capacity=500);
  replaceable ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl controller(
    final setpoint=300);
end OnOffVariant;