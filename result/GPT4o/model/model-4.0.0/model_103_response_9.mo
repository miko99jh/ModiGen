class DAEexample
 // Define variables
  Real x(start=0.9); // Initial value of x is 0.9
  Real y;
  Real der_x;
  Real der_y;
  Real time;

equation
  // Differential equation
  der_y + (1 + 0.5*sin(y))*der_x = sin(time);

  // Algebraic equation
  x - y = exp(-0.9*x)*cos(y);

  // Define the derivatives
  der_x = der(x);
  der_y = der(y);

  // Initial conditions
  initial equation
    x = 0.9; // Initial condition for x

end DAEexample;