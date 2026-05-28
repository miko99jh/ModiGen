class DAEexample
 parameter Real y_initial = 0.9 "Initial value of y";
  parameter Real x_initial = 0.9 "Initial value of x";
  parameter Real der_x_initial = 0 "Initial derivative of x";
  parameter Real der_y_initial = 0 "Initial derivative of y";
  Real x(start = x_initial) "Variable x";
  Real y(start = y_initial) "Variable y";
  Real der_x(start = der_x_initial) "Derivative of x";
  Real der_y(start = der_y_initial) "Derivative of y";
equation 
  der(x) = der_x;
  der(y) = der_y;
  der_x + (1 + 0.5*sin(y))*der_y = sin(time);
  x - y = exp(-0.9*x)*cos(y);
  der_x = -0.9*exp(-0.9*x)*cos(y) - sin(time);
  der_y = exp(-0.9*x)*cos(y) - der_x;
end DAEexample;