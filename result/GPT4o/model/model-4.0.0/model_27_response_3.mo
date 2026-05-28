block EventClock
 extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;

  parameter Boolean useSolver = false "Flag to use solver-based clock";
  parameter String solverMethod = "default" "Solver method for nested clock";

  Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal";
  output Modelica.Clocked.ClockSignals.Clock y "Output clock signal";

protected 
  Boolean previous_u = false "Stores the previous value of u";

equation
  // Check for rising edge of the input signal 'u'
  when u and not previous_u then
    if useSolver then
      // Instantiate a nested clock associated with the specified solver method
      y = Modelica.Clocked.ClockSignals.Clock(solverMethod);
    else
      // Define 'y' as a standard event clock triggered directly by 'u'
      y = Modelica.Clocked.ClockSignals.Clock();
    end if;
  end when;

  // Update the previous value of 'u'
  previous_u = u;
end EventClock;