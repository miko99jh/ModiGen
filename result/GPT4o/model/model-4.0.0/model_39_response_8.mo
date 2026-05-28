block AssignClockVectorized
 "Block that assigns a clock signal to a vector of Real input signals and outputs them as a clocked Real signal vector"

  parameter Integer n(min=1) = 1 
    "Size of input signal vector u (= size of output signal vector y)";

  input Real u[n] 
    "Vector of Real input signals";

  output Real y[n] 
    "Vector of Real output signals, clocked";

  input Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock 
    "Clock input signal";

protected 
  Modelica.Clocked.Sampler sampler[n](clock=clock) 
    "Sampler array to sample input signals on clock";

equation 
  for i in 1:n loop
    connect(sampler[i].u, u[i]);
    connect(sampler[i].y, y[i]);
  end for;

end AssignClockVectorized;