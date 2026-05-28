block EventClock extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock
  parameter Modelica.Blocks.Interfaces.BooleanInput u(start=false);
  Modelica.Blocks.Interfaces.Clock y;
  parameter Boolean useSolver=false;
  parameter Modelica.Blocks.Interfaces.Types.SolverMethod solverMethod=Modelica.Blocks.Interfaces.Types.SolverMethod.FixedStep;
equation
  if useSolver then
    Modelica.Blocks.Sources.Clock(clock=y, solverMethod=solverMethod) clock(clock=y, solverMethod=solverMethod);
  else
    y = Modelica.Blocks.Interfaces.Clock(when=Modelica.Blocks.Interfaces.Events.rising(u));
  end if;
end EventClock;