model PIController
 parameter Real waterLevel(start=0.2) "Current water level in the container";
  parameter Real target_height(start=1) "Target water level";
  parameter Real leakRate(start=0.1) "Rate at which water leaks out";
  parameter Real Kp(start=1) "Proportional coefficient";
  parameter Real Ki(start=0.5) "Integral coefficient";
  Real error "Height error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
  Real controlOutput "Control output";
initial equation
  error = target_height - waterLevel;
equation
  Pcontrol = Kp * error;
  Icontrol = Ki * integral(error, 0);
  controlOutput = Pcontrol + Icontrol;
  der(waterLevel) = -leakRate + controlOutput;
end PIController;