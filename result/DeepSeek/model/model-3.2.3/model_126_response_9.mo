model FirstOrderExperiment
 parameter Real k = 0.5 "Rate constant";
  Real x(start=2) "Variable to be converged";
equation
  der(x) = -k*x;
  when x < 1.0 then
    terminate("Experiment complete");
  end when;
end FirstOrderExperiment;