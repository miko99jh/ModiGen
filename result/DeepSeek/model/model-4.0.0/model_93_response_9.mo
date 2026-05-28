model PIDController
 parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Ki = 0.2 "Integral coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real target_height = 1 "Target height";
  parameter Real waterLevel_start = 0.2 "Initial water level";
  parameter Real leak_rate = 0.1 "Leak rate";
  Real error(start = target_height - waterLevel_start) "Height error";
  Real integral(start = 0) "Integral term";
  Real derivative(start = 0) "Derivative term";
  Real control(start = 0) "Control output";
equation
  // Proportional control
  Pcontrol = Kp * error;
  // Integral control
  integral = integral + Ki * error * timeStep;
  Icontrol = integral;
  // Differential control
  derivative = Kd * (error - derivative) / timeStep;
  Dcontrol = derivative;
  // Total control
  control = Pcontrol + Icontrol + Dcontrol;
  // Update water level
  der(waterLevel) = control - leak_rate;
  // Update error
  error = target_height - waterLevel;
end PIDController;