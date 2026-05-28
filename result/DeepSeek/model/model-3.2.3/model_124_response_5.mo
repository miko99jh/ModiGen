model AmbientCondition
  parameter Modelica.SIunits.Temperature T_amb "Ambient temperature";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a node "Heat transfer interface";
equation
  node.T = T_amb;
end AmbientCondition;