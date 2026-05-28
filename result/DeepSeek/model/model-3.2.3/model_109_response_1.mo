model IndependentSampling
  parameter Real samplingRate = 10 "Sampling rate in Hz";
  Real x(start=0) "Variable x sampled at 10Hz";
  Real y(start=0) "Variable y sampled at different rate";
  Real e "Error between x and y";
  Real next_time(start=0) "Next time to sample y";
initial equation
  next_time = time;
equation
  // Sampling x at 10Hz
  when {initial(), time > pre(next_time)} then
    x = x + 1;
    next_time = next_time + 1/samplingRate;
  end when;

  // Sampling y at different rate
  when {initial(), time > pre(next_time)} then
    y = y + 2;
    next_time = next_time + 0.1;
  end when;

  // Computing the error
  e = x - y;
end IndependentSampling;