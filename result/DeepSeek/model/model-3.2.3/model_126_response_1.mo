model FirstOrderExperiment
  parameter Real k = 0.1 "Rate constant";
  Real x(start=2) "Variable";
equation
  der(x) = -k*x;
  when x > 1.0 then
    terminate("Experiment finished");
  end when;
end FirstOrderExperiment;