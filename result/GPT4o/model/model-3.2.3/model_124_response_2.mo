model AmbientCondition
 parameter Modelica.SIunits.Temperature T_amb = 293.15 "Ambient temperature in Kelvin";
  
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a node "Heat transfer interface";

equation
  node.T = T_amb;
  node.Q_flow = 0; // No heat flow into or out of the infinite reservoir

annotation(
    Documentation(info="Model representing an infinite reservoir at ambient temperature. The temperature at the heat transfer interface is equal to the ambient temperature."));
end AmbientCondition;