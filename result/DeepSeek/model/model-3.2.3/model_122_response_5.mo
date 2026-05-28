model ClassicModel
  parameter Real alpha=0.1 "reproduction rate of the prey";
  parameter Real beta=0.02 "mortality rate of the predator per prey";
  parameter Real gamma=0.4 "general mortality rate of the predator";
  parameter Real delta=0.02 "reproduction rate of the predator per prey";
  parameter Real x0=10 "initial prey population";
  parameter Real y0=10 "initial predator population";
  
  Real x(start=x0) "prey population";
  Real y(start=y0) "predator population";
  
equation 
  der(x) = alpha*x - beta*x*y;
  der(y) = delta*x*y - gamma*y;
end ClassicModel;