block EventClock extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock
  parameter Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal";
  Modelica.Blocks.Interfaces.ClockOutput y(start=false) "Clock output signal";
  parameter Boolean useSolver=false "Flag to enable nested solver";
  parameter Modelica.Blocks.Types.SolverMethod solverMethod=Modelica.Blocks.Types.SolverMethod.FixedStep "Solver method to use for nested clock";
equation
  if useSolver then
    Modelica.Blocks.Types.Clock clock(
      Modelica.Blocks.Types.SolverMethod=solverMethod,
      Modelica.Blocks.Types.TriggerType=Modelica.Blocks.Types.TriggerType.Rising,
      Modelica.Blocks.Types.InitialValue=false);
    clock.u = u;
    y = clock.y;
  else
    y = Modelica.Blocks.Types.clock(Modelica.Blocks.Types.TriggerType.Rising, u, false);
  end if;
end EventClock;