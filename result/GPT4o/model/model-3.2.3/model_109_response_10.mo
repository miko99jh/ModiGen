model IndependentSampling
 // Declare real type variables
  Real x;
  Real y;
  Real e;
  Real next_time(start=0);

equation
  // Sample x directly at 10Hz
  when sample(0, 0.1) then
    x = time; // Example: x is sampled as the current time
  end when;

  // Sample y based on next_time condition
  when initial() or time > pre(next_time) then
    y = time; // Example: y is sampled as the current time
    next_time = next_time + 0.1; // Update next_time for the next sample
  end when;

  // Compute the error as the difference between x and y
  e = x - y;

end IndependentSampling;