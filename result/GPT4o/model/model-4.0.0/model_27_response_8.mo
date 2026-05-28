block EventClock
 extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;

  parameter Boolean useSolver = false "Flag to use solver method for clock generation";
  parameter String solverMethod = "default" "Solver method to be used if useSolver is true";

  Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal";

  output Modelica.Clocked.ClockSignals.Clock y "Output clock signal";

equation
  if useSolver then
    // Instantiate y as a nested clock associated with the specified solverMethod
    y = Modelica.Clocked.ClockSignals.Clock(
          solverMethod=solverMethod,
          baseClock=Modelica.Clocked.ClockSignals.Clock(u));
  else
    // Define y as a standard event clock triggered directly by u
    when u then
      y = Modelica.Clocked.ClockSignals.Clock(u);
    end when;
  end if;
end EventClock;