model ConventionOnOffActuator
 extends ModelicaByExample.Architectures.ThermalControl.Interfaces.Actuator;

  parameter Real heating_capacity "Heating capacity of the actuator";

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heater(
    redeclare Modelica.SIunits.HeatFlowRate Q_flow) 
    "Heat flow source representing the actuator";

  Modelica.Blocks.Math.BooleanToReal command(
    realTrue=heating_capacity, 
    realFalse=0) 
    "Converts on-off command to a real heat flow rate";

equation 
  // Connect the command output to the heater's heat flow rate input
  connect(command.y, heater.Q_flow);

  // Connect the heater's thermal port to the external furnace interface
  connect(heater.port, furnace);

end ConventionOnOffActuator;