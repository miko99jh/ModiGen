model FirstOrderExperiment
  parameter Real x(start=2) "State variable";
  parameter Real alpha(start=0.1) "Rate of convergence";
equation
  der(x) = -alpha*x;
  when x<1.0 then
    stop();
  end when;
end FirstOrderExperiment;