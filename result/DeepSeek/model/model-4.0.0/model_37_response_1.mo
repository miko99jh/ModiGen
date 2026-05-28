block AssignClock(Integer u, Integer y, Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock)
  extends Modelica.Blocks.Icons.Block;
equation 
  when clock then 
    y = u; 
  end when; 
end AssignClock;