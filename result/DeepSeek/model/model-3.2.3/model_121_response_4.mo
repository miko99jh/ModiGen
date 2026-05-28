model OnOffVariant
  extends ModelicaByExample.Architectures.ThermalControl.Examples.ExpandableModel;
  ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator actuator(
      heating_capacity = 500);
  ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl controller(
      setpoint = 300);
end OnOffVariant;