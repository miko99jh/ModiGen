class DAEexample
 // Declare variables
  Real x(start=0.9); // Initial value of x is 0.9
  Real y;
  Real time;
  
  // Declare derivatives
  Real der_x;
  Real der_y;

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
    // You may need to specify an initial condition for y if required

end DAEexample;