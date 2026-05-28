block BooleanChange
 extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;

  // Boolean input signal
  Modelica.Blocks.Interfaces.BooleanInput u;

  // Boolean output signal
  Modelica.Blocks.Interfaces.BooleanOutput y;

protected 
  // Variable to store the previous value of the input signal
  Boolean u_prev(start=false);

equation 
  // On the first activation, set the output to false
  when Clock() then
    if previous(u) <> u then
      y = true;
    else
      y = false;
    end if;
    // Update the previous value of the input signal
    u_prev = u;
  end when;

end BooleanChange;