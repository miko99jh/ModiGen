model PController
  parameter Real target_height = 1 "Target height of the water";
  parameter Real waterLevel = 0.2 "Initial water level in the reservoir";
  parameter Real Kp = 1 "Proportional factor";
  Real error;
  Real control;
  initial equation
    error = target_height - waterLevel;
  equation
    control = Kp * error;
    der(waterLevel) = control;
end PController;