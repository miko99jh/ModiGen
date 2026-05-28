model PIDController
  parameter Real Kp=1 "Proportional gain";
  parameter Real Ki=0.2 "Integral gain";
  parameter Real Kd=0.1 "Derivative gain";
  parameter Real target_height=1 "Target height";
  parameter Real initial_waterLevel=0.2 "Initial water level";
  parameter Real leak_rate=-0.1 "Leak rate";
  Real waterLevel(start=initial_waterLevel) "Water level";
  Real error "Height error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
  Real Dcontrol "Differential control";
  Real integral(start=0) "Integral of error";
  Real derivative(start=0) "Derivative of error";
  Real output(start=0) "Output of PID controller";
equation
  // Calculate the error
  error = target_height - waterLevel;
  
  // Calculate the proportional control
  Pcontrol = Kp * error;
  
  // Calculate the integral control
  integral = integral + error * timeStep;
  Icontrol = Ki * integral;
  
  // Calculate the derivative control
  derivative = (error - previous(error)) / timeStep;
  Dcontrol = Kd * derivative;
  
  // Calculate the output of the PID controller
  output = Pcontrol + Icontrol + Dcontrol;
  
  // Update the water level
  der(waterLevel) = output + leak_rate;
end PIDController;