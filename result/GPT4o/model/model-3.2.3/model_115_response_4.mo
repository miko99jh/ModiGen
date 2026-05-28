model ConventionOnOffActuator
 extends ModelicaByExample.Architectures.ThermalControl.Interfaces.Actuator;

  parameter Real heating_capacity "Heating capacity of the actuator";

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heater(
    Q_flow(start=0)) "Heat flow source representing the heater";

  Modelica.Blocks.Math.BooleanToReal command(
    redeclare parameter Real realTrue=heating_capacity,
    redeclare parameter Real realFalse=0) "Converts boolean control signal to real heat flow";

equation
  // Connect the command output to the heater's heat flow input
  connect(command.y, heater.Q_flow);

  // Connect the heater's thermal port to the external furnace interface
  connect(heater.port, furnace);

  // Ensure the actuator's control signal is connected to the command input
  connect(controlSignal, command.u);
  
end ConventionOnOffActuator;