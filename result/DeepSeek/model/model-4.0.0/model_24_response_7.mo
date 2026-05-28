function largerTimeConstant
  input Real a "Coefficient of s";
  input Real b "Coefficient of s^2";
  output Real T "Larger time constant";
algorithm 
  T := (a + sqrt(abs(a^2-4*b)))/2;
end largerTimeConstant;