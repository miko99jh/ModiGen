model PController1
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real target_height "Target altitude";

  Real waterLevel(start=0.2) "Actual altitude";
  Real error "Altitude error";
  Real control "Control signal";

equation
  error = target_height - waterLevel;
  control = Kp * error;
  der(waterLevel) = control;

end PController1;
