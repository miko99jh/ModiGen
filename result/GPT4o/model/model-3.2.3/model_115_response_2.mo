model ConventionOnOffActuator
 extends ModelicaByExample.Architectures.ThermalControl.Interfaces.Actuator;

  parameter Real heating_capacity "Heating capacity of the actuator";

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heater(
    Q_flow=command.y) "Heat flow source representing the actuator";

  Modelica.Blocks.Math.BooleanToReal command(
    redeclare Real realTrue=heating_capacity,
    redeclare Real realFalse=0) "Converts boolean control signal to real heat flow";

equation
  connect(command.u, controlSignal) "Connect control signal to command input";
  connect(heater.port, furnaceInterface) "Connect heater's thermal port to external furnace interface";

end ConventionOnOffActuator;