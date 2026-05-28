model PController
 // Parameters
  parameter Real Kp = 1.0 "Proportional gain";
  parameter Real target_height = 1.0 "Target water level in meters";
  parameter Real initial_waterLevel = 0.2 "Initial water level in meters";
  parameter Real timeStep = 0.1 "Time step for simulation in seconds";
  parameter Real maxTime = 10.0 "Maximum simulation time in seconds";

  // Variables
  Real waterLevel(start = initial_waterLevel) "Current water level in meters";
  Real error "Difference between target and current water level";
  Real control "Control signal to adjust water level";

equation
  // Calculate the error
  error = target_height - waterLevel;

  // Proportional control law
  control = Kp * error;

  // Update the water level
  der(waterLevel) = control;

  // Simulation time
  annotation(experiment(StartTime = 0, StopTime = maxTime, Interval = timeStep));
end PController;