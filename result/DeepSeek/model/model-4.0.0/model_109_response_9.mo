model IndependentSampling
  parameter Real samplingRate = 10 "Sampling rate of x and y";
  Real x(start=0) "Variable x sampled at 10Hz";
  Real y(start=0) "Variable y sampled at 10Hz";
  Real e "Error between x and y";
  Real next_time(start=0) "Time for next y sample";
equation
  // Sampling x at 10Hz
  when {initial(), time > pre(next_time)} then
    x = x + 1;
    next_time = time + 1/samplingRate;
  end when;

  // Sampling y at 10Hz
  when {initial(), time > pre(next_time)} then
    y = y + 1;
    next_time = time + 1/samplingRate;
  end when;

  // Computing error
  e = x - y;
end IndependentSampling;