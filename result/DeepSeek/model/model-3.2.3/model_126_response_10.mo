model FirstOrderExperiment
  parameter Real a = 0.1 "Rate of change";
  Real x(start=2) "State variable";
equation
  der(x) = -a*x;
  annotation(experiment(StartTime=0, StopTime=10, Tolerance=1e-6, Interval=0.01));
end FirstOrderExperiment;