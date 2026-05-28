model ClassicModel
  parameter Real alpha = 0.1 "Reproduction rate of the prey";
  parameter Real beta = 0.02 "Mortality rate of the predator per prey";
  parameter Real gamma = 0.4 "General mortality rate of the predator";
  parameter Real delta = 0.02 "Reproduction rate of the predator per prey";
  parameter Real x0 = 10 "Initial prey population";
  parameter Real y0 = 10 "Initial predator population";
  Real x(start=x0) "Prey population";
  Real y(start=y0) "Predator population";
equation
  der(x) = alpha*x - beta*x*y;
  der(y) = delta*x*y - gamma*y;
end ClassicModel;