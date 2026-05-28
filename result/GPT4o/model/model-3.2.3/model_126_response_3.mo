model FirstOrderExperiment
 // Define a real variable 'x' initialized to 2
  Real x(start=2);

equation
  // Define the first-order differential equation
  der(x) = -0.5 * (x - 1);

  // The equation above represents a simple first-order system
  // where 'x' converges towards 1.0 over time.

annotation(
  experiment(StartTime=0, StopTime=10, Tolerance=1e-6, Interval=0.1)
);

end FirstOrderExperiment;