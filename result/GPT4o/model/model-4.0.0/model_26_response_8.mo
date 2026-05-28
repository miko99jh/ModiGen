block BooleanChange
 extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;

  Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal";
  Modelica.Blocks.Interfaces.BooleanOutput y "Boolean output signal";

protected 
  Boolean u_prev(start=false) "Previous value of the input signal";

equation 
  when Clock() then
    if previous(Clock()) then
      y = (u <> u_prev);
    else
      y = false;
    end if;
    u_prev = u;
  end when;

end BooleanChange;