function largerTimeConstant
  input Real a;
  input Real b;
  output Real T;
algorithm 
  T := (a + sqrt(abs(a^2-4*b)))/2;
end largerTimeConstant;