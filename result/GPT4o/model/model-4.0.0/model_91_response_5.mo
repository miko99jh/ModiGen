model PIController
 // Parameters
  parameter Real target_height = 1.0; // Target water level in meters
  parameter Real Kp = 1.0;            // Proportional coefficient
  parameter Real Ki = 0.5;            // Integral coefficient
  parameter Real leak_rate = 0.1;     // Leak rate in meters per unit time

  // Variables
  Real waterLevel(start = 0.2);       // Initial water level in meters
  Real error;                         // Error in water level
  Real Pcontrol;                      // Proportional control action
  Real Icontrol;                      // Integral control action
  Real integralError(start = 0.0);    // Accumulated error for integral control

equation
  // Calculate error
  error = target_height - waterLevel;

  // Proportional control
  Pcontrol = Kp * error;

  // Integral control
  der(integralError) = error; // Accumulate error over time
  Icontrol = Ki * integralError;

  // Water level dynamics
  der(waterLevel) = Pcontrol + Icontrol - leak_rate;

  // Output for monitoring
  annotation (experiment(StartTime=0, StopTime=100, Tolerance=1e-6, Interval=0.1));
end PIController;