model PIController
  parameter Real target_height = 1;
  parameter Real Kp = 1;
  parameter Real Ki = 0.5;
  parameter Real leakRate = 0.1;
  parameter Real initial_waterLevel = 0.2;
  Real waterLevel(start = initial_waterLevel);
  Real error(start = target_height - initial_waterLevel);
  Real Pcontrol(start = Kp * error);
  Real Icontrol(start = 0);
equation
  // Define the differential equation for the water level
  der(waterLevel) = Pcontrol + Icontrol - leakRate;
  // Define the integral equation for the integral control
  Icontrol = Ki * integral(error);
  // Define the error as the difference between the target height and the current water level
  error = target_height - waterLevel;
end PIController;