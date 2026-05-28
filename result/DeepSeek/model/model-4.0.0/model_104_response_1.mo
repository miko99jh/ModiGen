model Summation
  parameter Integer n = 10;
  Real sum(start=0) = sum(1:n);

equation 
  assert(abs(sum - sum(1:n)) < 1e-6, "The sum is not calculated correctly");
end Summation;