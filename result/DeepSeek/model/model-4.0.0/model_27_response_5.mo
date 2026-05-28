block EventClock extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock
  parameter Modelica.Blocks.Interfaces.BooleanInput u(start=false);
  Modelica.Blocks.Interfaces.Clock y;
  parameter Boolean useSolver=false;
  parameter Modelica.Blocks.Interfaces.Types.SolverMethod solverMethod=Modelica.Blocks.Interfaces.Types.SolverMethod.FixedStep;
equation
  if useSolver then
    Modelica.Blocks.Interfaces.Clock nestedClock(solverMethod=solverMethod);
    y = nestedClock.y;
  else
    y = Modelica.Blocks.Interfaces.Events.clock(u);
  end if;
end EventClock;