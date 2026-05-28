block BooleanChange
 extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;

  Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal";
  Modelica.Blocks.Interfaces.BooleanOutput y "Boolean output signal";

protected 
  Boolean previousValue(start=false) "Stores the previous value of the input signal";

equation
  when Clock() then
    if initial() then
      y = false; // On the first activation, output is false
    else
      y = (u <> previousValue); // Output is true if the input has changed
    end if;
    previousValue = u; // Update the previous value
  end when;

end BooleanChange;