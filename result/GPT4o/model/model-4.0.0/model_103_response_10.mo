model DAEexample
 // Declare variables
  Real x(start=0.9); // Initial value of x
  Real y;
  Real der_x;
  Real der_y;
  Real time;

equation
  // Differential equations
  der_y + (1 + 0.5 * sin(y)) * der_x = sin(time);
  
  // Algebraic equation
  x - y = exp(-0.9 * x) * cos(y);
  
  // Define derivatives
  der(x) = der_x;
  der(y) = der_y;

  // Initial conditions
  x = 0.9; // Initial value of x

  // Time derivative
  der(time) = 1; // Assuming time progresses normally

end DAEexample;