model PDController
  parameter Real target_height = 1 "Target height of water in the container";
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real waterLevel_start = 0.2 "Initial water level in the container";
  Real waterLevel(start=waterLevel_start) "Current water level in the container";
  Real error "Height error";
  Real Pcontrol "Proportional control";
  Real Dcontrol "Differential control";
  Real waterLevel_prev "Previous water level in the container";
equation
  // Calculate the height error
  error = target_height - waterLevel;
  // Calculate the proportional control
  Pcontrol = Kp * error;
  // Calculate the differential control
  Dcontrol = Kd * (waterLevel - waterLevel_prev);
  // Update the water level
  der(waterLevel) = Pcontrol + Dcontrol;
  // Update the previous water level
  waterLevel_prev = waterLevel;
end PDController;