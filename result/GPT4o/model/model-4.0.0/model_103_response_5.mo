class DAEexample
 // Variables
  Real x(start=0.9); // Initial value of x is 0.9
  Real y;
  Real time;

equation
  // Differential equation
  der(y) + (1 + 0.5*sin(y))*der(x) = sin(time);

  // Algebraic equation
  x - y = exp(-0.9*x)*cos(y);

  // Initial condition for x
  initial equation
    x = 0.9;
end DAEexample;