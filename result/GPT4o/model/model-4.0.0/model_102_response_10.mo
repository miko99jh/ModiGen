model ArrayExample
 // Define the array with initial values
  parameter Integer n = 5;
  Integer data[n] = {1, 2, 3, 4, 5};
  
  // Variables to store results
  Integer abs1[n];
  Integer min1;
  Integer max1;
  Integer sum1;

equation
  // Calculate absolute values
  for i in 1:n loop
    abs1[i] = abs(data[i]);
  end for;

  // Calculate minimum value
  min1 = min(data);

  // Calculate maximum value
  max1 = max(data);

  // Calculate sum of all elements
  sum1 = sum(data);
end ArrayExample;