model IndependentSampling
 // Declare variables
  Real x;
  Real y;
  Real e;
  Real next_time(start=0.1); // Initialize next_time to 0.1 for the first sample

equation
  // Sample x directly at 10Hz
  when sample(0, 0.1) then
    x = sin(2 * Modelica.Constants.pi * time); // Example function for x
  end when;

  // Sample y based on next_time
  when {initial(), time > pre(next_time)} then
    y = cos(2 * Modelica.Constants.pi * time); // Example function for y
    next_time = pre(next_time) + 0.1; // Update next_time for the next sample
  end when;

  // Compute the error as the difference between x and y
  e = x - y;

end IndependentSampling;