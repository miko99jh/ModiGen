model OnOffVariant
  extends ModelicaByExample.Architectures.ThermalControl.Examples.ExpandableModel;
  replaceable actuator = ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator(heating_capacity=500);
  replaceable controller = ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl(setpoint=300);
end OnOffVariant;