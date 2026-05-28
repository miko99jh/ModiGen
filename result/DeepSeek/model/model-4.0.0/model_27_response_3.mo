block EventClock extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock
  parameter Modelica.Blocks.Interfaces.BooleanInput u(start=false);
  Modelica.Blocks.Interfaces.BooleanOutput y;
  parameter Modelica.Blocks.Interfaces.BooleanInput useSolver=false;
  parameter Modelica.Blocks.Interfaces.IntegerInput solverMethod=1;
equation
  if useSolver then
    Modelica.Blocks.Types.NestedClock clock(solverMethod=solverMethod);
    y = clock.trigger(u);
  else
    y = Modelica.Blocks.Types.EventClock(u);
  end if;
end EventClock;