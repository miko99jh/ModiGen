model PDController
  parameter Real waterLevel(min=0) = 0.2; // Initial water level
  parameter Real target_height = 1; // Target height
  parameter Real Kp = 1; // Proportional coefficient
  parameter Real Kd = 0.1; // Differential coefficient
  Real error; // Height error
  Real Pcontrol; // Proportional control
  Real Dcontrol; // Differential control
  Real waterLevel_dot; // Derivative of water level
initial equation
  error = target_height - waterLevel;
equation
  // Proportional control
  Pcontrol = Kp * error;
  // Differential control
  der(waterLevel) = Pcontrol + Kd * waterLevel_dot;
  // Update error and derivative of water level
  when time > 0 then
    error = target_height - waterLevel;
    waterLevel_dot = der(waterLevel);
  end when;
end PDController;