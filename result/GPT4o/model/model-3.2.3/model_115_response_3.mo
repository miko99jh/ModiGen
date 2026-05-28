model ConventionOnOffActuator
 extends ModelicaByExample.Architectures.ThermalControl.Interfaces.Actuator;

  parameter Real heating_capacity "Heating capacity of the actuator";

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heater 
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Math.BooleanToReal command(
    realTrue=heating_capacity, 
    realFalse=0) 
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

equation 
  // Connect the command output to the heater's heat flow rate input
  connect(command.y, heater.Q_flow) 
    annotation (Line(points={{-60,0},{-40,0}}, color={0,0,127}));

  // Connect the heater's thermal port to the external furnace interface
  connect(heater.port, furnace) 
    annotation (Line(points={{-20,0},{0,0}}, color={0,0,127}));

  annotation (
    Icon(graphics={
      Rectangle(extent={{-100,-50},{100,50}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),
      Text(extent={{-90,30},{90,50}}, textString="ConventionOnOffActuator", fontSize=12, lineColor={0,0,127})
    }),
    Diagram(graphics={
      Rectangle(extent={{-100,-50},{100,50}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),
      Text(extent={{-90,30},{90,50}}, textString="ConventionOnOffActuator", fontSize=12, lineColor={0,0,127})
    })
  );
end ConventionOnOffActuator;