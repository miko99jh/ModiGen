model PDController
 parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real target_height = 1 "Target height";
  parameter Real initial_waterLevel = 0.2 "Initial water level";
  Real waterLevel(start = initial_waterLevel) "Water level";
  Real error "Height error";
  Real Pcontrol "Proportional control";
  Real Dcontrol "Differential control";
  Real derivative "Derivative of water level";
initial equation
  error = target_height - initial_waterLevel;
equation
  Pcontrol = Kp * error;
  der(waterLevel) = Pcontrol + Kd * derivative;
  derivative = der(waterLevel);
end PDController;