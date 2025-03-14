block AssignClockVectorized1
  "Assign a clock to a clocked Real signal vector"

  parameter Integer n(min=1)=1
    "Size of input signal vector u (= size of output signal vector y)";
  Modelica.Blocks.Interfaces.RealInput u[n]
    "Connector of clocked, Real input signal";
  Modelica.Blocks.Interfaces.RealOutput y[n]
    "Connector of clocked, Real output signal";
  Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock;
equation
  when clock then
    y = u;
  end when;
end AssignClockVectorized1;
