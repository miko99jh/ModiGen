model OnOffVariant
 extends ModelicaByExample.Architectures.ThermalControl.Examples.ExpandableModel;
  ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffActuator actuator redeclare replaceable 
    "Actuator with heating capacity of 500 W"
    final parameter Modelica.SIunits.HeatingCapacity heating_capacity=500;
  ModelicaByExample.Architectures.ThermalControl.Implementations.OnOffControl controller redeclare replaceable 
    "Controller with setpoint of 300"
    final parameter Modelica.SIunits.Temperature setpoint=300;
end OnOffVariant;