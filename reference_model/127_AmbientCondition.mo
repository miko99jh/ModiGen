model AmbientCondition
  "Model of an \"infinite reservoir\" at some ambient temperature"
  parameter Modelica.SIunits.Temperature T_amb "Ambient temperature";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a node ;
equation
  node.T = T_amb;
end AmbientCondition;
