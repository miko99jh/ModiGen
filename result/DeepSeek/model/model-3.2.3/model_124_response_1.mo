model AmbientCondition
  parameter Modelica.SIunits.Temperature T_amb;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a node;
equation 
  node.T = T_amb;
end AmbientCondition;