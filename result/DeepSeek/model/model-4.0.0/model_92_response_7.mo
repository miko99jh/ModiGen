model PDController
  parameter Real target_height = 1 "Target height of water in the container";
  parameter Real waterLevel = 0.2 "Initial water level in the container";
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  Real error;
  Real Pcontrol;
  Real Dcontrol;
  Real waterLevel_dot;
equation 
  // Implement the control system here
  error = target_height - waterLevel;
  Pcontrol = Kp * error;
  Dcontrol = Kd * (waterLevel_dot - derivative(waterLevel, time));
  waterLevel_dot = Pcontrol + Dcontrol;
end PDController;