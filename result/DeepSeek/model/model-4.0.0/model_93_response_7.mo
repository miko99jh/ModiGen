model PIDController
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Ki = 0.2 "Integral coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real target_height = 1 "Target height";
  parameter Real initial_waterLevel = 0.2 "Initial water level";
  parameter Real leakRate = 0.1 "Leak rate";
  Real waterLevel(start = initial_waterLevel) "Water level in the container";
  Real error "Height error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
  Real Dcontrol "Differential control";
  Real integral(start = 0) "Integral of error";
  Real derivative(start = 0) "Derivative of error";
equation 
  // Define the error
  error = target_height - waterLevel;
  
  // Proportional control
  Pcontrol = Kp * error;
  
  // Integral control
  integral = integral + error * timeStep;
  Icontrol = Ki * integral;
  
  // Differential control
  derivative = (error - derivative) / timeStep;
  Dcontrol = Kd * derivative;
  
  // Update the water level
  der(waterLevel) = Pcontrol + Icontrol + Dcontrol - leakRate;
end PIDController;