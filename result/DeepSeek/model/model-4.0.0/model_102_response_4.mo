model ArrayExample
  parameter Integer n = 5;
  Real data[n] = {1, 2, 3, 4, 5};
  Real abs1[n];
  Real min1;
  Real max1;
  Real sum1;
equation 
  for i in 1:n loop
    abs1[i] = abs(data[i]);
  end for;
  min1 = min(data);
  max1 = max(data);
  sum1 = sum(data);
end ArrayExample;