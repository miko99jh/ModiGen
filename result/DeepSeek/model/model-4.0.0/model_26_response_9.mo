block BooleanChange extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon;
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y = false;
equation 
  y = if clock then
        if u then true else false
      else
        if u <> previous(u) then true else false;
end BooleanChange;