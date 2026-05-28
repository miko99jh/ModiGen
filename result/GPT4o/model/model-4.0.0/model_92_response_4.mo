model PDController
 // Parameters
  parameter Real Kp = 1 "Proportional gain";
  parameter Real Kd = 0.1 "Differential gain";
  parameter Real target_height = 1 "Target water level (m)";
  parameter Real initial_waterLevel = 0.2 "Initial water level (m)";
  parameter Real timeStep = 0.1 "Time step for simulation (s)";
  
  // Variables
  Real waterLevel(start = initial_waterLevel) "Current water level in the container";
  Real error "Difference between target and current water level";
  Real dError "Rate of change of error (derivative of error)";
  Real Pcontrol "Proportional control term";
  Real Dcontrol "Differential control term";
  Real controlSignal "Control signal (sum of Pcontrol and Dcontrol)";
  Real inflowRate "Rate of water inflow (m/s)";
  Real outflowRate = 0.05 "Constant outflow rate (m/s)";
  
equation
  // Error calculation
  error = target_height - waterLevel;
  
  // Proportional control
  Pcontrol = Kp * error;
  
  // Differential control (rate of change of error)
  der(error) = dError;
  Dcontrol = Kd * dError;
  
  // Control signal
  controlSignal = Pcontrol + Dcontrol;
  
  // Inflow rate is proportional to the control signal
  inflowRate = max(0, controlSignal); // Ensure inflow rate is non-negative
  
  // Water level dynamics
  der(waterLevel) = inflowRate - outflowRate;
  
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = timeStep),
    Documentation(info = "PDController model to maintain water level at target height using proportional-differential control."));
end PDController;