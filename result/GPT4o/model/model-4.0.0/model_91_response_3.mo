model PIController
 // Parameters
  parameter Real target_height = 1.0; // Target water level in meters
  parameter Real Kp = 1.0;            // Proportional coefficient
  parameter Real Ki = 0.5;            // Integral coefficient
  parameter Real leak_rate = 0.1;     // Leak rate in meters per unit time

  // Variables
  Real waterLevel(start=0.2);         // Current water level in meters
  Real inflow;                        // Inflow rate in meters per unit time
  Real error;                         // Error in water level
  Real integralError(start=0.0);      // Integral of the error

equation
  // Calculate the error
  error = target_height - waterLevel;

  // Proportional control to handle the leak
  inflow = Kp * error + Ki * integralError;

  // Update the integral of the error
  der(integralError) = error;

  // Update the water level considering inflow and leak
  der(waterLevel) = inflow - leak_rate;
end PIController;