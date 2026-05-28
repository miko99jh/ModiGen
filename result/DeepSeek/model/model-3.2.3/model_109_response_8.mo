model IndependentSampling
  parameter Real samplingRate = 10;
  Real x;
  Real y;
  Real e;
  Real next_time = 0;
equation
  // Sampling rate for x
  when {initial(), time > pre(next_time)} then
    x = sin(time);
    next_time = time + 1/samplingRate;
  end when;

  // Sampling rate for y
  when {initial(), time > pre(next_time)} then
    y = cos(time);
    next_time = time + 1/samplingRate;
  end when;

  // Error computation
  e = x - y;
end IndependentSampling;