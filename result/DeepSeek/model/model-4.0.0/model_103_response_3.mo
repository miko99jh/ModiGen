class DAEexample
  parameter Real initial_x = 0.9 "Initial value of x";
  Real x(start = initial_x) "Variable x";
  Real y(start = 0) "Variable y";
  Real time "Time";
equation
  der(x) + (1 + 0.5*sin(y))*der(y) = sin(time);
  x - y = exp(-0.9*x)*cos(y);
  initial equation
    x = initial_x;
end DAEexample;