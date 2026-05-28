block EventClock extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock
  parameter Modelica.Blocks.Interfaces.BooleanInput u(start=false) "Boolean input";
  Modelica.Blocks.Interfaces.Clock y(redeclare parameter Boolean start=false) "Clock output";
  parameter Boolean useSolver=false "Use nested solver";
  parameter Modelica.Blocks.Interfaces.Types.SolverMethod solverMethod=Modelica.Blocks.Interfaces.Types.SolverMethod.FixedStep "Solver method";
equation 
  if useSolver then
    Modelica.Blocks.Continuous.NestedClock(clock=y, solverMethod=solverMethod) annotation(Placement(transformation(extent={{-10,-10},{-10,-10}})));
  else
    y = Modelica.Blocks.Interfaces.Clock(when=u and not Modelica.Blocks.Interfaces.Clock(when=u.lastEvent));
  end if;
end EventClock;