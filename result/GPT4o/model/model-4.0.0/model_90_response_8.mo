model PController
 // Parameters
  parameter Real Kp = 1.0 "Proportional gain";
  parameter Real target_height = 1.0 "Target water level in meters";
  parameter Real initial_waterLevel = 0.2 "Initial water level in meters";
  parameter Real timeStep = 0.1 "Time step for simulation in seconds";
  parameter Real simulationTime = 10.0 "Total simulation time in seconds";

  // Variables
  Real waterLevel(start = initial_waterLevel) "Current water level in meters";
  Real error "Difference between target and current water level";
  Real control "Control signal";

equation
  // Proportional control equation
  error = target_height - waterLevel;
  control = Kp * error;

  // Update water level based on control signal
  der(waterLevel) = control;

  // Simulation time
  annotation(experiment(StartTime = 0, StopTime = simulationTime, Interval = timeStep));
end PController;