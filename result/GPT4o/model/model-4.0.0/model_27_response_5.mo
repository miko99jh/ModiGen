block EventClock
 extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;

  // Input Boolean signal
  Modelica.Blocks.Interfaces.BooleanInput u;

  // Output clock signal
  output Modelica.Clocked.ClockSignals.Clock y;

  // Parameter to decide if a solver should be used
  parameter Boolean useSolver = false;
  parameter String solverMethod = "default";

protected 
  // Internal variable to detect rising edge
  Boolean pre_u(start=false);

equation 
  // Detect rising edge of the input signal
  pre_u = pre(u);

  // Generate clock signal based on the rising edge of 'u'
  when {u and not pre_u} then
    if useSolver then
      // Instantiate clock as a nested clock with solver
      y = Modelica.Clocked.Clocks.NestedClock(solverMethod=solverMethod);
    else
      // Define 'y' as a standard event clock
      y = Modelica.Clocked.Clocks.EventClock();
    end if;
  end when;

end EventClock;