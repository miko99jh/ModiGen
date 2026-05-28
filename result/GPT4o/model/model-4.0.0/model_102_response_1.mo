model ArrayExample
 // Define the array and its length
  parameter Integer n = 5;
  parameter Integer data[n] = {1, 2, 3, 4, 5};

  // Variables to store results
  Integer abs1[n];
  Integer min1;
  Integer max1;
  Integer sum1;

equation
  // Calculate the absolute values of the array elements
  for i in 1:n loop
    abs1[i] = abs(data[i]);
  end for;

  // Calculate the minimum value
  min1 = min(data);

  // Calculate the maximum value
  max1 = max(data);

  // Calculate the sum of all elements
  sum1 = sum(data);

end ArrayExample;