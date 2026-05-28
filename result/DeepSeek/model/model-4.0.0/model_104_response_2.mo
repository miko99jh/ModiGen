model Summation
  parameter Integer n = 10;
  Real sum(start = 0);
algorithm 
  for i in 1:n loop
    sum := sum + i;
  end for;
end Summation;