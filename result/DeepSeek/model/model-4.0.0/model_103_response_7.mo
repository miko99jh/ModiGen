class DAEexample
  parameter Real x0 = 0.9 "Initial value of x";
  Real x(start=x0) "Variable x";
  Real y(start=0) "Variable y";
  Real derx(start=0) "Derivative of x";
  Real dery(start=0) "Derivative of y";
equation
  der(x) = derx;
  der(y) = dery;
  derx + (1+0.5*sin(y))*derx = sin(time);
  x-y = exp(-0.9*x)*cos(y);
  derx + (1+0.5*sin(y))*derx = sin(time);
  x-y = exp(-0.9*x)*cos(y);
end DAEexample;