block AssignClockVectorized
 parameter Integer n(min=1) = 1 "Size of input signal vector u (= size of output signal vector y)";
  
  Modelica.Blocks.Interfaces.RealInput u[n] "Vector of Real input signals";
  Modelica.Blocks.Interfaces.RealOutput y[n] "Vector of Real output signals";
  Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock "Clock input signal";

equation
  when sample(clock) then
    y = u;
  end when;
end AssignClockVectorized;