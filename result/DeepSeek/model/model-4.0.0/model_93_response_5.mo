model PIDController
 parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Ki = 0.2 "Integral coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real target_height = 1 "Target height";
  parameter Real waterLevel_start = 0.2 "Initial water level";
  parameter Real leak_rate = 0.1 "Leak rate";
  Real error(start = target_height - waterLevel_start) "Height error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
  Real Dcontrol "Differential control";
  Real waterLevel(start = waterLevel_start) "Water level";
equation
  // Define the error
  error = target_height - waterLevel;
  // Implement the PID control
  Pcontrol = Kp * error;
  Icontrol = Ki * integral(error, 0);
  Dcontrol = Kd * der(waterLevel);
  // Update the water level
  der(waterLevel) = Pcontrol + Icontrol + Dcontrol - leak_rate;
end PIDController;