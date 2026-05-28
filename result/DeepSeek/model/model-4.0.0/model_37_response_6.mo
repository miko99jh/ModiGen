block AssignClock(Integer u, Integer y, Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock)
  extends Modelica.Blocks.Logical.IfClocked(
    condition = true,
    clocked = clock,
    thenPort = Modelica.Blocks.Interfaces.RealOutput(y = u));
end AssignClock;