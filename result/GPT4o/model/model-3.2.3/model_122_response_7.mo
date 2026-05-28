model ClassicModel
 // Parameters
  parameter Real alpha = 0.1 "Reproduction rate of prey";
  parameter Real beta = 0.02 "Mortality rate of predator per prey";
  parameter Real gamma = 0.4 "General mortality rate of predator";
  parameter Real delta = 0.02 "Reproduction rate of predator per prey";

  // State variables
  Real x(start=10) "Prey population";
  Real y(start=10) "Predator population";

equation
  // Differential equations
  der(x) = alpha * x - beta * x * y;
  der(y) = delta * x * y - gamma * y;
end ClassicModel;