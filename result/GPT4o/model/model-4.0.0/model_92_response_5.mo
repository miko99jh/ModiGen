model PDController
 // Parameters
  parameter Real target_height = 1.0; // Target water level in meters
  parameter Real Kp = 1.0;            // Proportional coefficient
  parameter Real Kd = 0.1;            // Differential coefficient

  // Variables
  Real waterLevel(start = 0.2);       // Current water level in meters
  Real error;                         // Error in water level
  Real Pcontrol;                      // Proportional control
  Real Dcontrol;                      // Differential control
  Real controlSignal;                 // Control signal to adjust water level
  Real previousError(start = 0.0);    // Previous error for differential control

equation
  // Calculate the error
  error = target_height - waterLevel;

  // Proportional control
  Pcontrol = Kp * error;

  // Differential control
  Dcontrol = Kd * (error - previousError);

  // Control signal
  controlSignal = Pcontrol + Dcontrol;

  // Update water level based on control signal
  der(waterLevel) = controlSignal;

  // Update previous error
  previousError = error;

end PDController;