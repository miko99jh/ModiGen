model PIController
  parameter Real waterLevel(min=0) = 0.2;
  parameter Real target_height = 1;
  parameter Real leakRate = 0.1;
  parameter Real Kp = 1;
  parameter Real Ki = 0.5;
  Real error;
  Real Pcontrol;
  Real Icontrol;
  Real controlOutput;
equation
  error = target_height - waterLevel;
  Pcontrol = Kp * error;
  Icontrol = Ki * integral(error, 0);
  controlOutput = Pcontrol + Icontrol;
  der(waterLevel) = controlOutput - leakRate;
end PIController;