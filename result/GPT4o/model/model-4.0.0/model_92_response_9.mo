model PDController
 // Parameters
  parameter Real Kp = 1 "Proportional gain";
  parameter Real Kd = 0.1 "Differential gain";
  parameter Real target_height = 1 "Target water level (m)";
  parameter Real initial_waterLevel = 0.2 "Initial water level (m)";
  
  // Variables
  Real waterLevel(start = initial_waterLevel) "Current water level (m)";
  Real error "Height error (m)";
  Real dError "Rate of change of error (m/s)";
  Real Pcontrol "Proportional control output";
  Real Dcontrol "Differential control output";
  Real controlSignal "Control signal (m/s)";
  
  // Time derivative of water level
  Real waterLevelRate "Rate of change of water level (m/s)";
  
equation
  // Error calculation
  error = target_height - waterLevel;
  
  // Proportional control
  Pcontrol = Kp * error;
  
  // Differential control
  der(error) = dError; // Derivative of error
  Dcontrol = Kd * dError;
  
  // Control signal
  controlSignal = Pcontrol + Dcontrol;
  
  // Water level dynamics
  der(waterLevel) = controlSignal;
  
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.1),
    Documentation(info = "PD Controller to maintain water level at target height."));
end PDController;