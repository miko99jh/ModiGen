model PIController
 // Parameters
  parameter Real target_height = 1.0; // Target water level in meters
  parameter Real Kp = 1.0;            // Proportional gain
  parameter Real Ki = 0.5;            // Integral gain
  parameter Real leak_rate = 0.1;     // Leak rate in meters per unit time

  // State variables
  Real waterLevel(start = 0.2);       // Initial water level in meters
  Real error;                         // Error between target and actual water level
  Real integralError(start = 0.0);    // Integral of the error

  // Control actions
  Real Pcontrol;                      // Proportional control action
  Real Icontrol;                      // Integral control action
  Real controlAction;                 // Total control action

equation
  // Calculate the error
  error = target_height - waterLevel;

  // Proportional control
  Pcontrol = Kp * error;

  // Integral control
  der(integralError) = error;         // Integrate the error over time
  Icontrol = Ki * integralError;

  // Total control action
  controlAction = Pcontrol + Icontrol;

  // Water level dynamics
  der(waterLevel) = controlAction - leak_rate;

end PIController;