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
  // Implement the proportional differential control
  Pcontrol = Kp*error;
  Dcontrol = Kd*(waterLevel_dot - derivative(waterLevel, 0));
  waterLevel_dot = Pcontrol + Dcontrol;
  der(waterLevel) = waterLevel_dot;
end PDController;