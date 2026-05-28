model PController
  parameter Real target_height = 1 "Target height of water in reservoir";
  parameter Real Kp = 1 "Proportional control factor";
  Real waterLevel(start = 0.2) "Water level in the pool";
  Real error "Error between target and actual water level";
  Real control "Control signal";
equation 
  // Define the error
  error = target_height - waterLevel;

  // Define the control signal
  control = Kp * error;

  // Define the change of water level over time
  der(waterLevel) = control;
end PController;