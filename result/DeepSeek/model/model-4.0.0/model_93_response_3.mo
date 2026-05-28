model PIDController
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Ki = 0.2 "Integral coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real target_height = 1 "Target height";
  parameter Real initial_waterLevel = 0.2 "Initial water level";
  parameter Real leak_rate = 0.1 "Leak rate";
  Real waterLevel(start = initial_waterLevel) "Water level";
  Real error "Error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
  Real Dcontrol "Differential control";
  Real integral(start = 0) "Integral term";
  Real derivative(start = 0) "Derivative term";
  Real previous_error(start = 0) "Previous error";
equation
  // Calculate the error
  error = target_height - waterLevel;
  
  // Calculate the proportional control
  Pcontrol = Kp * error;
  
  // Calculate the integral control
  integral = integral + Ki * error * time;
  Icontrol = integral;
  
  // Calculate the derivative control
  derivative = Kd * (error - previous_error) / time;
  Dcontrol = derivative;
  
  // Update the water level
  der(waterLevel) = Pcontrol + Icontrol + Dcontrol - leak_rate;
  
  // Update the previous error
  previous_error = error;
end PIDController;