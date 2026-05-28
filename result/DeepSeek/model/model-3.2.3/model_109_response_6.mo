model IndependentSampling
  parameter Real samplingRate = 10 "Sampling rate in Hz";
  Real x(start=0) "Variable x";
  Real y(start=0) "Variable y";
  Real e "Error between x and y";
  Real next_time(start=0) "Next time to sample y";
initial equation
  next_time = time + 0.1;
equation
  // Sampling 'x' at 10Hz
  when (time - pre(time) >= 1/samplingRate) then
    x = x + 1;
  end when;

  // Sampling 'y' at 0.1Hz
  when (time > next_time) then
    y = x;
    next_time = time + 0.1;
  end when;

  // Computing the error
  e = x - y;
end IndependentSampling;