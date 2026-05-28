model PDController
 // Parameters
  parameter Real Kp = 1.0 "Proportional gain";
  parameter Real Kd = 0.1 "Derivative gain";
  parameter Real target_height = 1.0 "Target water level in meters";
  parameter Real initial_waterLevel = 0.2 "Initial water level in meters";
  parameter Real dt = 0.1 "Time step for simulation";

  // Variables
  Real waterLevel(start = initial_waterLevel) "Current water level";
  Real error "Error between target and current water level";
  Real previous_error = 0.0 "Previous error for derivative calculation";
  Real Pcontrol "Proportional control action";
  Real Dcontrol "Derivative control action";
  Real control_signal "Control signal to adjust water level";

equation
  // Calculate the error
  error = target_height - waterLevel;

  // Proportional control
  Pcontrol = Kp * error;

  // Derivative control
  Dcontrol = Kd * (error - previous_error) / dt;

  // Control signal
  control_signal = Pcontrol + Dcontrol;

  // Update water level
  der(waterLevel) = control_signal;

  // Update previous error
  when sample(0, dt) then
    previous_error = error;
  end when;

end PDController;