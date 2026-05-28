model PIDController
 // Parameters
  parameter Real Kp = 1.0 "Proportional gain";
  parameter Real Ki = 0.2 "Integral gain";
  parameter Real Kd = 0.1 "Derivative gain";
  parameter Real target_height = 1.0 "Target water level in meters";
  parameter Real leak_rate = 0.1 "Leak rate in meters per unit time";

  // Variables
  Real waterLevel(start = 0.2) "Current water level in meters";
  Real error "Error between target and current water level";
  Real integral "Integral of the error";
  Real derivative "Derivative of the error";
  Real previous_error "Previous error value";
  Real control_signal "Control signal to adjust water level";

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

  // Initialize previous error
  when initial() then
    previous_error = error;
  end when;

end PIDController;