block AssignClockVectorized
 parameter Integer n(min=1) = 1 "Size of input signal vector u (= size of output signal vector y)";
  
  // Inputs
  input Real u[n] "Vector of Real input signals";
  input Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock "Clock input signal";

  // Outputs
  output Real y[n] "Vector of Real output signals";

protected 
  // Internal clocked data
  Modelica.Clocked.RealSignals.ClockedRealOutput yClocked[n];

equation 
  // Assign the input vector u to the clocked output yClocked on clock tick
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