block BooleanChange
 extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;

  // Boolean input signal
  Modelica.Blocks.Interfaces.BooleanInput u;

  // Boolean output signal
  Modelica.Blocks.Interfaces.BooleanOutput y;

protected
  // Variable to store the previous value of the input signal
  Boolean previousValue(start=false);

initial equation
  // On the initial activation of the clock, the output should default to 'false'
  y = false;

equation
  when ClockSample() then
    // On subsequent ticks, output 'true' if the current value of 'u' differs from its previous value
    y = (u <> previousValue);
    // Update the previous value to the current value of 'u'
    previousValue = u;
  end when;
end BooleanChange;