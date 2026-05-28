block EventClock extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock
  parameter Modelica.Blocks.Interfaces.BooleanInput u(start=false);
  Modelica.Blocks.Interfaces.ClockOutput y;
  parameter Boolean useSolver=false;
  parameter Modelica.Blocks.Interfaces.Types.SolverMethod solverMethod=Modelica.Blocks.Interfaces.Types.SolverMethod.FixedStep;
equation
  if useSolver then
    Modelica.Blocks.Continuous.EventClock(clock=y, event=u, solver=solverMethod);
  else
    y = Modelica.Blocks.Interfaces.ClockOutput(clock=y, event=u);
  end if;
end EventClock;