block EventClock extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock
  parameter Modelica.Blocks.Interfaces.BooleanInput u(start=false) "Boolean input";
  Modelica.Blocks.Interfaces.ClockOutput y(redeclare model Modelica.Blocks.Types.Clock y_clock);

equation
  if useSolver then
    // Instantiate a nested clock associated with the specified solver method
    Modelica.Blocks.Types.Clock y_clock(solverMethod=solverMethod);
  else
    // Define y as a standard event clock triggered directly by u
    Modelica.Blocks.Types.EventClock y_clock(trigger=u);
  end if;
end EventClock;