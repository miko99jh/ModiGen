function largerTimeConstant
 // Input parameters
  input Real a "Coefficient of s in the polynomial";
  input Real b "Coefficient of s^2 in the polynomial";
  
  // Output parameter
  output Real T "Larger time constant T1";
  
algorithm
  // Calculate the larger time constant using the given formula
  T := (a + sqrt(abs(a^2 - 4*b))) / 2;
end largerTimeConstant;