model IndependentSampling
 // Declare variables
  Real x;
  Real y;
  Real e;
  Real next_time(start=0.1); // Initialize next_time to 0.1 for the first sample

equation
  // Direct sampling of x at 10Hz
  when sample(0, 0.1) then
    x = time; // Example: x is sampled as the current time
  end when;

  // Sampling of y based on next_time
  when {initial(), time > pre(next_time)} then
    y = time; // Example: y is sampled as the current time
    next_time = pre(next_time) + 0.1; // Update next_time for the next sample
  end when;

  // Compute the error as the difference between x and y
  e = x - y;

end IndependentSampling;