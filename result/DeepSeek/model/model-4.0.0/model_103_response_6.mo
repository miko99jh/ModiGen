class DAEexample
 parameter Real x0 = 0.9 "Initial value of x";
  Real x(start = x0) "State variable x";
  Real y(start = 0) "State variable y";
  Real time "Time";
equation
  der(x) + (1 + 0.5*sin(y))*der(y) = sin(time);
  x - y = exp(-0.9*x)*cos(y);
  when time > 0 then
    annotation(
      Experiment(StartTime = time, StopTime = 10, Tolerance = 1e-6, InitialStepSize = 1e-6)
    );
  end when;
end DAEexample;