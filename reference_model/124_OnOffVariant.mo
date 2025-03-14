model OnOffVariant1 "Variation with on-off control"
  extends ModelicaByExample.Architectures.ThermalControl.Examples.ExpandableModel(
 redeclare replaceable
   ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator actuator(heating_capacity=500),
 redeclare replaceable
   ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl controller(setpoint=300));
end OnOffVariant1;
