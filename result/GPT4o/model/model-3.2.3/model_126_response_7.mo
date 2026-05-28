model FirstOrderExperiment
 // Declare the real variable x
  Real x(start=2);

equation
  // Define the first-order differential equation
  der(x) = -0.5 * (x - 1);

  // Experiment annotation to specify simulation conditions
  annotation(
    experiment(StartTime=0, StopTime=10, Tolerance=1e-6, Interval=0.1)
  );
end FirstOrderExperiment;