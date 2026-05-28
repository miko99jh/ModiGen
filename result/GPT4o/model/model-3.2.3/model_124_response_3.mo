model AmbientCondition
 // Import the necessary Modelica library
  import Modelica.SIunits.Temperature;
  import Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a;

  // Parameter for ambient temperature
  parameter Temperature T_amb = 293.15 "Ambient temperature in Kelvin";

  // Heat transfer interface
  HeatPort_a node;

equation
  // Ensure the temperature at the node is equal to the ambient temperature
  node.T = T_amb;

  // Since this is an infinite reservoir, no heat flow occurs
  node.Q_flow = 0;
  
end AmbientCondition;