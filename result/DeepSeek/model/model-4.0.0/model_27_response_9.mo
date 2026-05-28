block EventClock extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock
  input Modelica.Blocks.Interfaces.BooleanInput u;
  output Modelica.Clocked.ClockSignals.Interfaces.Clock y;
  parameter Modelica.Clocked.ClockSignals.Interfaces.SolverMethod solverMethod = Modelica.Clocked.ClockSignals.Interfaces.SolverMethod.None;
  parameter Boolean useSolver = false;
equation
  if useSolver then
    if solverMethod == Modelica.Clocked.ClockSignals.Interfaces.SolverMethod.None then
      y = Modelica.Clocked.ClockSignals.Clock(clockOnEvent = u);
    else
      y = Modelica.Clocked.ClockSignals.NestedClock(clockOnEvent = u, solverMethod = solverMethod);
    end if;
  else
    y = Modelica.Clocked.ClockSignals.Clock(clockOnEvent = u);
  end if;
end EventClock;