model FirstOrderExperiment
  parameter Real x(start=2) "State variable";
  parameter Real k(start=0.1) "Rate constant";
equation
  der(x) = -k*x;
  when x < 1.0 then
    terminate("Experiment complete");
  end when;
end FirstOrderExperiment;