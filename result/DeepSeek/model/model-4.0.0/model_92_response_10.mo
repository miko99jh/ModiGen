model PDController
  parameter Real waterLevel(unit="m") = 0.2;
  parameter Real target_height(unit="m") = 1;
  parameter Real Kp = 1;
  parameter Real Kd = 0.1;
  Real error(unit="m");
  Real Pcontrol(unit="m/s");
  Real Dcontrol(unit="m/s");
  Real waterLevel_dot(unit="m/s");
equation
  // Define the error as the difference between the target height and the current water level
  error = target_height - waterLevel;
  
  // Implement the proportional control
  Pcontrol = Kp * error;
  
  // Implement the differential control
  Dcontrol = Kd * der(error);
  
  // The change in water level is the sum of the proportional and differential control
  waterLevel_dot = Pcontrol + Dcontrol;
end PDController;