model PController
  parameter Real target_height = 1 "Target water level in reservoir";
  parameter Real Kp = 1 "Proportional control factor";
  Real waterLevel(start = 0.2) "Current water level in reservoir";
  Real error "Error in water level";
  Real control "Control signal";
equation
  error = target_height - waterLevel;
  control = Kp * error;
  der(waterLevel) = control;
end PController;