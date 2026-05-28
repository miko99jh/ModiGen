model PController
  parameter Real target_height = 1 "Target height of the water";
  parameter Real Kp = 1 "Proportional control factor";
  Real waterLevel(start = 0.2) "Current height of the water";
  Real error "Error in height";
  Real control "Control signal";
equation
  error = target_height - waterLevel;
  control = Kp * error;
  der(waterLevel) = control;
end PController;