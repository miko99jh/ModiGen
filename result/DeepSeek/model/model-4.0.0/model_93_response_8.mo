model PIDController
 parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Ki = 0.2 "Integral coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real waterLevel(start = 0.2) "Current water level in the container";
  parameter Real target_height(start = 1) "Target water level";
  parameter Real leakRate(start = 0.1) "Water leak rate";
  Real error "Height error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
  Real Dcontrol "Differential control";
  Real output "Output";
initial equation
  error = target_height - waterLevel;
equation
  Pcontrol = Kp * error;
  Icontrol = Ki * integral(error, 0);
  Dcontrol = Kd * der(waterLevel);
  output = Pcontrol + Icontrol + Dcontrol;
  der(waterLevel) = output - leakRate;
end PIDController;