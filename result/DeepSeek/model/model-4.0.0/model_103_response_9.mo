class DAEexample
  parameter Real y0 = 0.9 "Initial value of y";
  Real x(start=0.9) "Dependent variable x";
  Real y(start=y0) "Dependent variable y";
  Real ydot "Derivative of y";
equation 
  der(x) = ydot - 0.5*sin(y)*sin(x);
  der(y) = -ydot - 0.5*sin(y)*sin(x) + sin(time);
  x - y = exp(-0.9*x)*cos(y);
end DAEexample;