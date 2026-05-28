model ConventionOnOffActuator
  extends ModelicaByExample.Architectures.ThermalControl.Interfaces.Actuator;
  parameter Real heating_capacity;
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heater;
  Modelica.Blocks.Math.BooleanToReal command(realTrue=heating_capacity, realFalse=0);
equation 
  connect(command.y, heater.Q_flow);
  connect(heater.port, externalFurnace.port);
end ConventionOnOffActuator;