model PredatorPreySystem1 "This is the typical equation-oriented model"
  parameter Real alpha=0.1 "Reproduction rate of prey";
  parameter Real beta=0.02 "Mortality rate of predator per prey";
  parameter Real gamma=0.4 "Mortality rate of predator";
  parameter Real delta=0.02 "Reproduction rate of predator per prey";
  parameter Real x0=10 "Start value of prey population";
  parameter Real y0=10 "Start value of predator population";
  Real x(start=x0) "Prey population";
  Real y(start=y0) "Predator population";
equation
  der(x) = x*(alpha-beta*y);
  der(y) = y*(delta*x-gamma);
end PredatorPreySystem1;
