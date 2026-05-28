block EventClock
 extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;

  parameter Boolean useSolver = false "Flag to use solver-based clock";
  parameter String solverMethod = "default" "Solver method for nested clock";

  Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal";
  output Modelica.Clocked.ClockSignals.Clock y "Output clock signal";

protected
  Boolean previous_u(start=false) "Previous value of input signal";

equation
  // Update previous_u at each event
  when u <> previous_u then
    previous_u = u;
  end when;

  // Generate clock signal based on input change
  if useSolver then
    // Instantiate nested clock with solver method
    y = Modelica.Clocked.ClockSignals.Clock(y, solverMethod);
  else
    // Standard event clock triggered by input change
    when u and not previous_u then
      y = Modelica.Clocked.ClockSignals.Clock(y);
    end when;
  end if;
end EventClock;