block BooleanChange extends Modelica.Clocked.ClockSignals.Interfaces.ClockedBlockIcon
  parameter String blockName="BooleanChange" "Name of the block";
  Modelica.Blocks.Interfaces.BooleanInput u;
  Modelica.Blocks.Interfaces.BooleanOutput y=false;
equation
  y = if clock then
        if not old(clock) then
          false
        else
          u <> old(u)
        end if
      else
        y
      end if;
end BooleanChange;