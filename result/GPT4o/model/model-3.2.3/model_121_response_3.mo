model OnOffVariant
 extends ModelicaByExample.Architectures.ThermalControl.Examples.ExpandableModel;

  redeclare replaceable ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator actuator(
    heating_capacity=500) "On-Off Actuator with specified heating capacity";

  redeclare replaceable ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl controller(
    setpoint=300) "On-Off Controller with specified setpoint";

end OnOffVariant;