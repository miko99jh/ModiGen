block BooleanChange
 extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;

  // Boolean input signal
  Modelica.Blocks.Interfaces.BooleanInput u;

  // Boolean output signal
  Modelica.Blocks.Interfaces.BooleanOutput y;

protected 
  // Variable to store the previous value of the input signal
  Boolean previous_u(start=false);

equation 
  // On the first activation of the clock, output is false
  when Clock() then
    if initial() then
      y = false;
    else
      // Output is true if the current value of 'u' differs from 'previous_u'
      y = (u <> previous_u);
    end if;
    // Update the previous value of 'u'
    previous_u = u;
  end when;

end BooleanChange;