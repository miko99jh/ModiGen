model PDController
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real target_height = 1 "Target height of water level";
  Real waterLevel(start = 0.2) "Water level in the container";
  Real error "Height error";
  Real Pcontrol "Proportional control";
  Real Dcontrol "Differential control";
  Real derivative "Derivative of waterLevel";
initial equation
  error = target_height - waterLevel;
equation
  Pcontrol = Kp * error;
  derivative = der(waterLevel);
  Dcontrol = Kd * derivative;
  der(waterLevel) = Pcontrol + Dcontrol;
end PDController;