model ConventionOnOffActuator "Attempt to implement on-off actuator"
  extends ModelicaByExample.Architectures.ThermalControl.Interfaces.Actuator;
  parameter Real heating_capacity "Heating capacity of actuator";
protected
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heater;
  Modelica.Blocks.Math.BooleanToReal command(realTrue=heating_capacity, realFalse=0);
equation
  connect(heater.port, furnace);
  connect(command.y, heater.Q_flow);
end ConventionOnOffActuator;
