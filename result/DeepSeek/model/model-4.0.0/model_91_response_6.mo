model PIController
  parameter Real waterLevel(min=0) = 0.2; // initial water level
  parameter Real target_height = 1; // target height
  parameter Real Kp = 1; // proportional coefficient
  parameter Real Ki = 0.5; // integral coefficient
  parameter Real leakRate = 0.1; // leak rate
  parameter Real dt = 0.01; // time step
  Real error; // height error
  Real Pcontrol; // proportional control
  Real Icontrol; // integral control
  Real waterLevel_next; // next water level
  Real integralError; // integral of error
initial equation
  error = target_height - waterLevel;
equation
  // proportional control
  Pcontrol = Kp * error;
  // integral control
  integralError = integralError + error * dt;
  Icontrol = Ki * integralError;
  // next water level
  waterLevel_next = waterLevel - leakRate * dt + Pcontrol + Icontrol;
  // update water level
  der(waterLevel) = (waterLevel_next - waterLevel) / dt;
end PIController;