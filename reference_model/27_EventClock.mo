block EventClock1
  "Generate a clock signal when the Boolean input changes from false to true"
  extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;
  Modelica.Blocks.Interfaces.BooleanInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  if useSolver then
     y = Clock(Clock(u), solverMethod=solverMethod);
  else
     y = Clock(u);
  end if;
end EventClock1;
