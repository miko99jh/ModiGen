model PController
  parameter Real target_height = 1 "Target height of the water level";
  parameter Real Kp = 1 "Proportional factor";
  Real waterLevel(start=0.2) "Water level in the reservoir";
  Real error "Altitude error";
  Real control "Control signal";
equation
  error = target_height - waterLevel;
  control = Kp * error;
  der(waterLevel) = control;
end PController;