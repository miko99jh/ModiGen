block BooleanChange
 extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;

  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y;

protected 
  Boolean previousValue(start=false);

equation 
  when Clock() then
    if initial() then
      y = false;
    else
      y = (u <> previousValue);
    end if;
    previousValue = u;
  end when;

end BooleanChange;