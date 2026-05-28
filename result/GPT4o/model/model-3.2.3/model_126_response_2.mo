model FirstOrderExperiment
 // Declare a real variable 'x'
  Real x(start=2);

equation
  // Define the first-order differential equation
  der(x) = -x + 1;

  // The equation above will make 'x' converge towards 1.0 over time

annotation(
  experiment(StartTime=0, StopTime=10, Tolerance=1e-6, Interval=0.1));
end FirstOrderExperiment;