function largerTimeConstant
 "Calculate the larger time constant T1 in a polynomial voltage characteristic in a power grid"
  input Real a "Coefficient of s in the polynomial";
  input Real b "Coefficient of s^2 in the polynomial";
  output Real T "Larger time constant T1 (T1 > T2)";
algorithm
  T := (a + sqrt(abs(a^2 - 4*b))) / 2;
end largerTimeConstant;