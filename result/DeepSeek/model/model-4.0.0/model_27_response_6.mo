block EventClock
  extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;
  parameter Modelica.Blocks.Interfaces.BooleanInput u(start=false);
  Modelica.Blocks.Interfaces.BooleanOutput y;
  parameter Modelica.Blocks.Interfaces.BooleanInput useSolver=false;
  parameter Modelica.Blocks.Interfaces.BooleanInput solverMethod=false;
equation
  if useSolver then
    Modelica.Blocks.Types.BlockTypes.NestedClock(
      clock=y,
      clockTrigger=u,
      solverMethod=solverMethod
    );
  else
    y = Modelica.Blocks.Types.BlockTypes.EventClock(clockTrigger=u);
  end if;
end EventClock;