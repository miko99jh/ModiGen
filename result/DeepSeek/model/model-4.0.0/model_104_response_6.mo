model Summation
  parameter Integer n = 10;
  Integer sum = 0;
  algorithm 
    for i in 1:n loop
      sum := sum + i;
    end for;
  end algorithm;
end Summation;