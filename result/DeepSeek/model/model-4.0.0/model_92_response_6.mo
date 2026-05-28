model PDController
 parameter Real target_height = 1 "Target height of water";
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real waterLevel(start = 0.2) "Current water level in the container";
  parameter Real error(start = 0.8) "Height error";
  parameter Real Pcontrol(start = 0.8) "Proportional control";
  parameter Real Dcontrol(start = 0) "Differential control";
  parameter Real previous_error(start = 0.8) "Previous error";
  parameter Real dt = 0.01 "Time step";
equation
  // Proportional control
  Pcontrol = Kp * error;
  // Differential control
  Dcontrol = Kd * (error - previous_error) / dt;
  // Update water level
  der(waterLevel) = Pcontrol + Dcontrol;
  // Update error
  error = target_height - waterLevel;
  // Update previous error
  previous_error = error;
end PDController;