class DAEexample
  extends Modelica.Blocks.Interfaces.PartialDAE;
  parameter Real x0=0.9 "Initial value of x";
  Real x(start=x0) "State of x";
  Real y(start=0) "State of y";
  Real der_x "Derivative of x";
  Real der_y "Derivative of y";
equation 
  der(x) = der_x;
  der(y) = der_y;
  der_x + (1+0.5*sin(y))*der_x = sin(time);
  x-y = exp(-0.9*x)*cos(y);
end DAEexample;