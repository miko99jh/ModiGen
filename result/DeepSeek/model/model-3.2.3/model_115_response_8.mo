model ConventionOnOffActuator
  extends ModelicaByExample.Architectures.ThermalControl.Interfaces.Actuator(redeclare parameter Real heating_capacity = 1000 "Heating capacity of the actuator");
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heater(Q_flow = command.y*heating_capacity);
  Modelica.Blocks.Math.BooleanToReal command(realTrue = heating_capacity, realFalse = 0);
equation 
  connect(heater.port, port);
  connect(command.u, heater.Q_flow);
end ConventionOnOffActuator;