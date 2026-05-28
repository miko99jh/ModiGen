model IndependentSampling
  parameter Real samplingRate = 10 "Sampling rate in Hz";
  Real x(start=0) "Variable sampled directly";
  Real y(start=0) "Variable sampled at different rate";
  Real e "Error between x and y";
  Real next_time(start=0) "Next time to sample y";

equation
  // Sample x directly
  der(x) = 0;

  // Sample y at a different rate
  if (time >= next_time) then
    der(y) = 0;
    next_time = time + 1/samplingRate;
  end if;

  // Compute the error
  e = x - y;
end IndependentSampling;