model IndependentSampling
  parameter Real samplingRate = 10; // Sampling rate in Hz
  Real x; // Variable sampled directly
  Real y; // Variable sampled at a different rate
  Real e; // Error between x and y
  Real next_time = 0; // Next time to sample y

  equation
    // Sample x directly at the specified sampling rate
    when {initial(), time > pre(next_time)} then
      x = sin(time); // Sample x as a sine wave
      next_time = next_time + (1/samplingRate); // Update next_time
    end when;

    // Sample y at a different rate
    when {initial(), time > pre(next_time)} then
      y = cos(time); // Sample y as a cosine wave
      next_time = next_time + (1/samplingRate); // Update next_time
    end when;

    // Compute the error between x and y
    e = x - y;
end IndependentSampling;