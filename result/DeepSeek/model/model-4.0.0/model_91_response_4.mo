model PIController
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Ki = 0.5 "Integral coefficient";
  parameter Real target_height = 1 "Target height";
  parameter Real initial_waterLevel = 0.2 "Initial water level";
  parameter Real leak_rate = 0.1 "Leak rate";
  Real waterLevel(start = initial_waterLevel) "Water level";
  Real error "Error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
  Real integral "Integral of error";
equation
  // Define the error
  error = target_height - waterLevel;
  // Implement the proportional control
  Pcontrol = Kp * error;
  // Implement the integral control
  integral = integral + Ki * error * timeStep;
  Icontrol = integral;
  // Update the water level
  der(waterLevel) = Pcontrol + Icontrol - leak_rate;
end PIController;