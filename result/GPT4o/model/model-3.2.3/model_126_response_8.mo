model FirstOrderExperiment
 // Declare a real variable 'x'
  Real x(start=2);

equation
  // Define the first-order differential equation
  der(x) = -x + 1;

  // The equation above represents a system where 'x' will converge towards 1.0
  // The term '-x' pulls 'x' towards zero, while the '+1' term shifts the equilibrium to 1.0

  // Experiment annotation to specify simulation settings
  annotation(
    experiment(StartTime=0, StopTime=10, Tolerance=1e-6, Interval=0.1));
end FirstOrderExperiment;