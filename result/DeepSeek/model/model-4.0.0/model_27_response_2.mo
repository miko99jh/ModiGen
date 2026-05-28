block EventClock extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock
  parameter Modelica.Blocks.Interfaces.BooleanInput u(start=false) "Boolean input";
  Modelica.Blocks.Interfaces.ClockOutput y(clock=u) "Clock output";
  parameter Modelica.Blocks.Types.SolverMethod solverMethod=Modelica.Blocks.Types.SolverMethod.FixedStep "Solver method";
  parameter Boolean useSolver=false "Use solver";

equation
  if useSolver then
    Modelica.Blocks.Types.PartialClock clock(solverMethod=solverMethod);
    clock.y = y;
    when u then
      clock.trigger();
  else
    when u then
      y = true;
    when not u then
      y = false;
  end if;
end EventClock;