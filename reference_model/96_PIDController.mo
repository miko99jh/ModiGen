model PIDController1
  parameter Real Kp=1 "Proportional coefficient";
  parameter Real Ki=0.2 "Integral coefficient";
  parameter Real Kd=0.1 "Differential coefficient";
  parameter Real target_height=1 "Target altitude";

  Real waterLevel(start=0.2) "Actual altitude";
  Real error "Altitude error";
  Real Pcontrol "Proportional Control signal", Icontrol "Integral Control signal", Dcontrol "Differential Control signal";   

equation
  error = target_height - waterLevel;
  Pcontrol = Kp * error-0.1;
  error = der(Icontrol/Ki);
  Dcontrol = Kd * der(error);
  der(waterLevel) = Pcontrol + Icontrol + Dcontrol;

end PIDController1;
