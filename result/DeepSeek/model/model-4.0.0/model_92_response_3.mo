model PDController
 parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real target_height = 1 "Target height";
  parameter Real initial_waterLevel = 0.2 "Initial water level";
  Real waterLevel(start = initial_waterLevel) "Water level in the container";
  Real error "Height error";
  Real Pcontrol "Proportional control";
  Real Dcontrol "Differential control";
  Real derivative "Derivative of water level";
equation
  // Define the height error
  error = target_height - waterLevel;

  // Define the proportional control
  Pcontrol = Kp * error;

  // Define the differential control
  derivative = der(waterLevel);
  Dcontrol = Kd * derivative;

  // Define the change of the water level
  der(waterLevel) = Pcontrol + Dcontrol;
end PDController;