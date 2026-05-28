model FirstOrderExperiment
  parameter Real x(start=2) "Variable x";
  parameter Real k = 0.1 "Rate constant";
equation
  der(x) = -k*x;
  annotation(experiment(StartTime=0, StopTime=100, Tolerance=1e-6, Interval=10));
end FirstOrderExperiment;