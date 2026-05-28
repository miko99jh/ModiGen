model PController
  parameter Real target_height=1 "Target height of water in reservoir";
  parameter Real Kp=1 "Proportional gain";
  Real waterLevel(start=0.2) "Water level in reservoir";
  Real error "Altitude error";
  Real control "Control signal";
initial equation
  error = target_height - waterLevel;
equation
  control = Kp * error;
  der(waterLevel) = control;
end PController;