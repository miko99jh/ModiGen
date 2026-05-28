model PIController
  parameter Real waterLevel(min=0) = 0.2;
  parameter Real target_height = 1;
  parameter Real Kp = 1;
  parameter Real Ki = 0.5;
  parameter Real leakRate = 0.1;
  Real error;
  Real Pcontrol;
  Real Icontrol;
  Real output;
initial equation
  error = target_height - waterLevel;
equation
  Pcontrol = Kp * error;
  Icontrol = Ki * integral(error, 0);
  output = Pcontrol + Icontrol;
  der(waterLevel) = output - leakRate;
end PIController;