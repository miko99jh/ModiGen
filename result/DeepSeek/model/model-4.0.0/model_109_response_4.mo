model IndependentSampling
  parameter Real sampleRate = 10 "Sampling rate of x and y";
  Real x(start=0) "Variable sampled at a fixed rate";
  Real y(start=0) "Variable sampled at a different rate";
  Real e "Difference between x and y";
  Real next_time "Time for the next sample of y";
initial equation
  next_time = time;
equation
  // Sampling of x
  when sampleRate*pre(next_time) <= time then
    x = x + 1;
  end when;

  // Sampling of y
  when time > pre(next_time) then
    y = y + 1;
    next_time = time + 0.1;
  end when;

  // Computing the error
  e = x - y;
end IndependentSampling;