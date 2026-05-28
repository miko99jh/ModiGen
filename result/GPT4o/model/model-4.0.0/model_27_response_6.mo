block EventClock
 extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;

  parameter Boolean useSolver = false "Flag to use solver-based clock";
  parameter String solverMethod = "default" "Solver method for nested clock";

  Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal";
  output Modelica.Clocked.ClockSignals.Clock y "Output clock signal";

equation
  if useSolver then
    // Instantiate a nested clock associated with the specified solver method
    y = Modelica.Clocked.ClockSignals.Clock(u, solverMethod);
  else
    // Define y as a standard event clock triggered directly by u
    when u then
      y = Modelica.Clocked.ClockSignals.Clock(u);
    end when;
  end if;
end EventClock;