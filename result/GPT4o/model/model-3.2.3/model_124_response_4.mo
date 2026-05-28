model AmbientCondition
 // Parameter for ambient temperature
  parameter Modelica.SIunits.Temperature T_amb = 293.15 
    "Ambient temperature (default: 20°C)";

  // Heat transfer interface
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a node 
    "Heat transfer interface representing the infinite reservoir";

equation
  // Enforce the temperature at the node to be equal to the ambient temperature
  node.T = T_amb;

  // Since this is an infinite reservoir, no heat is stored in the model
  node.Q_flow = 0;
end AmbientCondition;