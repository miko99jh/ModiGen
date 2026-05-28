model PIController
 // Parameters
  parameter Real target_height = 1.0; // Target water level in meters
  parameter Real Kp = 1.0;            // Proportional coefficient
  parameter Real Ki = 0.5;            // Integral coefficient
  parameter Real leak_rate = 0.1;     // Leak rate in meters per unit time

  // Variables
  Real waterLevel(start=0.2);         // Current water level in meters
  Real error;                         // Error in water level
  Real Pcontrol;                      // Proportional control action
  Real Icontrol;                      // Integral control action
  Real inflow;                        // Water inflow rate

  // Integral state
  Real integralError(start=0.0);      // Accumulated error for integral control

equation
  // Calculate error
  error = target_height - waterLevel;

  // Proportional control
  Pcontrol = Kp * error;

  // Integral control
  der(integralError) = error;         // Accumulate error over time
  Icontrol = Ki * integralError;

  // Total inflow rate
  inflow = Pcontrol + Icontrol;

  // Water level dynamics
  der(waterLevel) = inflow - leak_rate;

end PIController;