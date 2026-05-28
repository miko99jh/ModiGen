block BooleanChange
 extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;

  // Boolean input signal
  input Modelica.Blocks.Interfaces.BooleanInput u;

  // Boolean output signal
  output Modelica.Blocks.Interfaces.BooleanOutput y;

protected
  // Internal variable to store the previous value of 'u'
  Boolean u_previous(start=false);

equation
  // On the first activation of the clock, output 'y' is false
  when Clock() then
    if previous(Clock()) then
      // For subsequent ticks, detect changes in 'u'
      y = u <> u_previous;
    else
      // Initial activation of the clock
      y = false;
    end if;

    // Update the previous value of 'u'
    u_previous = u;
  end when;
end BooleanChange;