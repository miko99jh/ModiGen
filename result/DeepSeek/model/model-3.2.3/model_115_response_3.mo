model ConventionOnOffActuator
  extends ModelicaByExample.Architectures.ThermalControl.Interfaces.Actuator(redeclare parameter Real heating_capacity = 1000 "Heating capacity of the actuator");
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heater;
  Modelica.Blocks.Math.BooleanToReal command(realTrue=heating_capacity, realFalse=0);
equation
  command.y = heater.Q_flow;
  connect(heater.port, port);
end ConventionOnOffActuator;