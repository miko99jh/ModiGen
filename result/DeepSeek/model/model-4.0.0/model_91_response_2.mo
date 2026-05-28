model PIController
  parameter Real target_height = 1 "Target height of the water";
  parameter Real initial_waterLevel = 0.2 "Initial water level";
  parameter Real leakRate = 0.1 "Leak rate";
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Ki = 0.5 "Integral coefficient";
  Real waterLevel(start = initial_waterLevel) "Water level in the container";
  Real error "Height error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
equation 
  // Calculate error
  error = target_height - waterLevel;
  // Calculate proportional control
  Pcontrol = Kp * error;
  // Calculate integral control
  Icontrol = Ki * integral(error, 0);
  // Update water level
  der(waterLevel) = Pcontrol + Icontrol - leakRate;
end PIController;