block AssignClockVectorized
 parameter Integer n(min=1) = 1 "Size of input signal vector u (= size of output signal vector y)";
  
  // Input and output vectors
  Modelica.Blocks.Interfaces.RealInput u[n] "Vector of Real input signals";
  Modelica.Blocks.Interfaces.RealOutput y[n] "Vector of Real output signals";
  
  // Clock input
  Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock "Clock input signal";

protected 
  // Internal clocked data
  Modelica.Clocked.RealSignals.ClockedReal yClocked[n](each clock=clock) "Clocked version of output signals";

equation 
  // Assign input to output on clock tick
  when ClockSample(clock) then
    for i in 1:n loop
      yClocked[i] = u[i];
    end for;
  end when;

  // Connect clocked output to continuous output
  for i in 1:n loop
    y[i] = yClocked[i];
  end for;

end AssignClockVectorized;