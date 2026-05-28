class DAEexample
  parameter Real x0 = 0.9 "Initial value of x";
  Real x(start=x0) "Variable x";
  Real y(start=0) "Variable y";
  Real t "Time";
equation
  der(x) + (1+0.5*sin(y))*der(y) = sin(t);
  x-y = exp(-0.9*x)*cos(y);
  x0 = 0.9;
end DAEexample;