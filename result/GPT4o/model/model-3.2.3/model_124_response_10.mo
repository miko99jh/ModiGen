model AmbientCondition
 parameter Modelica.SIunits.Temperature T_amb = 293.15 "Ambient temperature in Kelvin";
  
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a node "Heat transfer interface";

equation
  node.T = T_amb;
  node.Q_flow = 0; // No heat flow into or out of the infinite reservoir

annotation(
    Icon(graphics={
        Rectangle(
          extent={{-100, 100}, {100, -100}},
          lineColor={0, 0, 255},
          fillColor={255, 255, 255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80, 80}, {80, -80}},
          textString="Ambient\nCondition",
          fontSize=12,
          textColor={0, 0, 0})
    }));
end AmbientCondition;