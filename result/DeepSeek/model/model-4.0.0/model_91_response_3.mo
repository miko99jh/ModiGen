model PIController
  parameter Real target_height = 1 "Target height of water in container";
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Ki = 0.5 "Integral coefficient";
  parameter Real waterLevel_start = 0.2 "Initial water level";
  parameter Real leakRate = 0.1 "Rate at which water leaks out";
  Real error(start=target_height-waterLevel_start) "Height error";
  Real Pcontrol "Proportional control";
  Real Icontrol "Integral control";
  Real waterLevel(start=waterLevel_start) "Current water level";
equation 
  der(waterLevel) = -leakRate + Pcontrol + Icontrol;
  Pcontrol = Kp*error;
  der(Icontrol) = Ki*error;
  annotation(experiment(StopTime=200,StartTime=0));
end PIController;