block EventClock
 extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;

  parameter Boolean useSolver = false "Flag to use solver-based clock";
  parameter String solverMethod = "default" "Solver method to use if useSolver is true";

  Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal";

  Modelica.Clocked.Clock y "Output clock signal";

protected 
  Boolean pre_u;

equation 
  // Store the previous value of u
  pre_u = pre(u);

  // Generate the clock signal based on the change from false to true
  if useSolver then
    // Instantiate y as a nested clock associated with the specified solverMethod
    when {u and not pre_u} then
      y = Modelica.Clocked.Clocks.NestedClock(solverMethod=solverMethod);
    end when;
  else
    // Define y as a standard event clock triggered directly by u
    when {u and not pre_u} then
      y = Modelica.Clocked.Clocks.EventClock();
    end when;
  end if;

end EventClock;