model PIController
  parameter Real target_height = 1 "Target height of water in container";
  parameter Real initial_waterLevel = 0.2 "Initial height of water in container";
  parameter Real leakRate = 0.1 "Rate at which water leaks out of container";
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Ki = 0.5 "Integral coefficient";
  Real waterLevel(start = initial_waterLevel) "Height of water in container";
  Real error(start = target_height - initial_waterLevel) "Height error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
equation 
  // Define the proportional control
  Pcontrol = Kp * error;

  // Define the integral control
  Icontrol = Ki * (integral(error, 0) + error);

  // Define the change in water level
  der(waterLevel) = Pcontrol + Icontrol - leakRate;

  // Define the error
  error = target_height - waterLevel;
end PIController;