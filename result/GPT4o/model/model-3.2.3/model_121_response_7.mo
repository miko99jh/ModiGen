model OnOffVariant
 extends ModelicaByExample.Architectures.ThermalControl.Examples.ExpandableModel;

  redeclare replaceable ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator actuator(
    heating_capacity=500);

  redeclare replaceable ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl controller(
    setpoint=300);

  // Additional components and connections can be added here if needed

end OnOffVariant;