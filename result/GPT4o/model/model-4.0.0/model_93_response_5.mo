model PIDController
 // Parameters
  parameter Real target_height = 1.0; // Target water level in meters
  parameter Real Kp = 1.0;            // Proportional gain
  parameter Real Ki = 0.2;            // Integral gain
  parameter Real Kd = 0.1;            // Derivative gain
  parameter Real leak_rate = 0.1;     // Leak rate in meters per unit time

  // Variables
  Real waterLevel(start = 0.2);       // Initial water level
  Real error;                         // Error in water level
  Real integral = 0.0;                // Integral of error
  Real derivative;                    // Derivative of error
  Real previous_error = 0.0;          // Previous error for derivative calculation
  Real control_signal;                // Control signal from PID controller

equation
  // Error calculation
  error = target_height - waterLevel;

  // Integral calculation
  der(integral) = error;

  // Derivative calculation
  derivative = der(error);

  // PID control signal
  control_signal = Kp * error + Ki * integral + Kd * derivative;

  // Water level dynamics
  der(waterLevel) = control_signal - leak_rate;

  // Update previous error
  when sample(0, 0.1) then
    previous_error = error;
  end when;

end PIDController;