model PIController
 // Parameters
  parameter Real target_height = 1.0; // Target water level in meters
  parameter Real Kp = 1.0;            // Proportional gain
  parameter Real Ki = 0.5;            // Integral gain
  parameter Real leak_rate = 0.1;     // Leak rate in meters per unit time

  // Variables
  Real waterLevel(start = 0.2);       // Initial water level in meters
  Real error;                         // Error between target and actual water level
  Real Pcontrol;                      // Proportional control action
  Real Icontrol;                      // Integral control action
  Real integralError = 0.0;           // Accumulated error for integral control

equation
  // Calculate the error
  error = target_height - waterLevel;

  // Proportional control action
  Pcontrol = Kp * error;

  // Integral control action
  der(integralError) = error;         // Accumulate the error over time
  Icontrol = Ki * integralError;

  // Water level dynamics
  der(waterLevel) = Pcontrol + Icontrol - leak_rate;

end PIController;