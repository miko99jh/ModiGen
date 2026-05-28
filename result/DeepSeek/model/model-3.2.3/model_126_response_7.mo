model FirstOrderExperiment
  parameter Real k = 0.1 "Rate constant";
  Real x(start=2) "State variable";
equation
  der(x) = -k*x;
  when x < 1.0 then
    terminate("Experiment complete");
  end when;
end FirstOrderExperiment;