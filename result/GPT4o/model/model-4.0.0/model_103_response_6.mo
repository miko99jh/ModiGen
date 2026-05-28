model DAEexample
 // Declare variables
  Real x(start=0.9); // Initial value of x
  Real y;
  Real time;
  Real der_x;
  Real der_y;

equation
  // Differential equation
  der_y + (1 + 0.5 * sin(y)) * der_x = sin(time);

  // Algebraic equation
  x - y = exp(-0.9 * x) * cos(y);

  // Define derivatives
  der(x) = der_x;
  der(y) = der_y;

  // Initial conditions
  initial equation
    x = 0.9; // Initial condition for x

end DAEexample;