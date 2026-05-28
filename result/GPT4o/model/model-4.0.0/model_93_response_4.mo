model PIDController
 // Parameters
  parameter Real target_height = 1.0; // Target water level in meters
  parameter Real Kp = 1.0;            // Proportional coefficient
  parameter Real Ki = 0.2;            // Integral coefficient
  parameter Real Kd = 0.1;            // Differential coefficient
  parameter Real leak_rate = 0.1;     // Leak rate in meters per unit time

  // Variables
  Real waterLevel(start = 0.2);       // Current water level in meters
  Real error;                         // Error in water level
  Real Pcontrol;                      // Proportional control
  Real Icontrol;                      // Integral control
  Real Dcontrol;                      // Differential control
  Real integralError(start = 0);      // Accumulated error for integral control
  Real previousError(start = 0);      // Previous error for differential control
  Real controlOutput;                 // Total control output

equation
  // Calculate error
  error = target_height - waterLevel;

  // Proportional control
  Pcontrol = Kp * error;

  // Integral control
  der(integralError) = error; // Accumulate error over time
  Icontrol = Ki * integralError;

  // Differential control
  Dcontrol = Kd * (error - previousError);
  previousError = error;

  // Total control output
  controlOutput = Pcontrol + Icontrol + Dcontrol;

  // Update water level
  der(waterLevel) = controlOutput - leak_rate;

end PIDController;