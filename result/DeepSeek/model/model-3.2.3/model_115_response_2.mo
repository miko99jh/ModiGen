model ConventionOnOffActuator
  extends ModelicaByExample.Architectures.ThermalControl.Interfaces.Actuator(final heating_capacity = 100);
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heater;
  Modelica.Blocks.Math.BooleanToReal command(realTrue = heating_capacity, realFalse = 0);
equation 
  connect(command.y, heater.Q_flow);
  connect(heater.port, port);
end ConventionOnOffActuator;