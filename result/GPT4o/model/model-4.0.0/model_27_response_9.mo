block EventClock
 extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;

  parameter Boolean useSolver = false "Flag to use solver-based clock";
  parameter String solverMethod = "default" "Solver method for nested clock";

  Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal";
  output Modelica.Clocked.ClockSignals.Clock y "Output clock signal";

protected 
  Boolean previous_u = false "Stores the previous value of u";

equation
  // Detect rising edge of the Boolean input signal
  when u and not previous_u then
    if useSolver then
      // Instantiate nested clock with solver method
      y = Modelica.Clocked.ClockSignals.Clock(solverMethod);
    else
      // Directly trigger event clock
      y = Modelica.Clocked.ClockSignals.Clock();
    end if;
  end when;

  // Update previous_u at each time step
  previous_u = u;
end EventClock;