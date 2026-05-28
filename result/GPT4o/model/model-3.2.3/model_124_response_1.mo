model AmbientCondition
 parameter Modelica.SIunits.Temperature T_amb = 293.15 "Ambient temperature in Kelvin";
  
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a node "Heat transfer interface";

equation
  node.T = T_amb;
  node.Q_flow = 0; // No heat flow into or out of the infinite reservoir
end AmbientCondition;