model PDController1
  parameter Real Kp=1 "Proportional coefficient";
  parameter Real Kd=0.1 "Differential coefficient";
  parameter Real target_height=1 "Target altitude";

  Real waterLevel(start=0.2) "Actual altitude";
  Real error "Altitude error";
  Real Pcontrol "Proportional Control signal", Dcontrol "Differential Control signal";

equation
  error = target_height - waterLevel;
  Pcontrol = Kp * error;
  Dcontrol = Kd * der(error);
  der(waterLevel) = Pcontrol + Dcontrol;

end PDController1;
