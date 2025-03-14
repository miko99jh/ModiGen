model Summation1
  Integer n = 10;
  Real sum;
algorithm
  sum := 0;
  for i in 1:n loop
    sum := sum + i;
  end for;
end Summation1;
