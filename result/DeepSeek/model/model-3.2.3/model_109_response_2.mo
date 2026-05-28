model IndependentSampling
  parameter Real sampleRate = 10 "Sampling rate in Hz";
  Real x(start=0) "First variable to sample";
  Real y(start=0) "Second variable to sample";
  Real e "Error between x and y";
  Real next_time(start=0) "Next time to sample y";
initial equation
  next_time = time;
equation
  // Sample x at 10Hz
  when {initial(), time > pre(next_time)} then
    x = x + 1;
    next_time = next_time + 1/sampleRate;
  end when;

  // Sample y at different rate
  when {initial(), time > pre(next_time)} then
    y = y + 2;
    next_time = next_time + 0.1;
  end when;

  // Compute error
  e = x - y;
end IndependentSampling;