model FirstOrderExperiment
  parameter Real k = 0.1 "Rate constant";
  Real x(start = 2) "Variable to converge towards 1.0";
equation
  der(x) = -k * (x - 1);
  when x < 1.0 then
    terminate("Convergence reached");
  end when;
end FirstOrderExperiment;