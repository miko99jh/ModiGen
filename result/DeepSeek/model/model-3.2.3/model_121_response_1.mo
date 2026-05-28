model OnOffVariant
  extends ModelicaByExample.Architectures.ThermalControl.Examples.ExpandableModel;
  ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator actuator = ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator(heating_capacity=500);
  ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl controller = ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl(setpoint=300);
end OnOffVariant;