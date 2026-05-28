model Summation
  parameter Integer n = 10;
  Real sum;
equation
  sum = 0;
  for i in 1:n loop
    sum = sum + i;
  end for;
end Summation;