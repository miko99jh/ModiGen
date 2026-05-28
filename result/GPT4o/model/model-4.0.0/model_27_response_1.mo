block EventClock
 extends Modelica.Clocked.ClockSignals.Interfaces.PartialClock;

  // Input Boolean signal
  input Modelica.Blocks.Interfaces.BooleanInput u;

  // Output clock signal
  output Clock y;

protected 
  // Internal variable to detect rising edge of 'u'
  Boolean u_prev(start=false, fixed=true);

equation 
  // Detect rising edge of 'u'
  when u and not pre(u) then
    u_prev = true;
  elsewhen not u then
    u_prev = false;
  end when;

  // Generate clock signal 'y'
  if useSolver then
    y = Modelica.Clocked.Clocks.NestedClock(solverMethod=solverMethod);
  else
    y = Modelica.Clocked.Clocks.EventClock(trigger=u and not pre(u));
  end if;

end EventClock;