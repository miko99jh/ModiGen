model IndependentSampling
  parameter Real samplingRate = 10 "Sampling rate in Hz";
  Real x(start=0) "First variable to be sampled";
  Real y(start=0) "Second variable to be sampled";
  Real e "Error between x and y";
  Real next_time(start=0) "Next time to sample y";
equation
  // Sampling 'x' at 10Hz
  when {initial(), time > pre(next_time)} then
    x = x + 1;
    next_time = time + 1/samplingRate;
  end when;

  // Sampling 'y' at a different rate
  when {initial(), time > next_time} then
    y = y + 2;
    next_time = next_time + 0.1;
  end when;

  // Computing the error
  e = x - y;
end IndependentSampling;