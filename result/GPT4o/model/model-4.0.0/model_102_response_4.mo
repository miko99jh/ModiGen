model ArrayExample
 // Define the array and its length
  parameter Integer n = 5; // Length of the array
  parameter Integer data[n] = {1, 2, 3, 4, 5}; // Initialize the array
  
  // Variables to store results
  Integer abs1[n]; // Array to store absolute values
  Integer min1;    // Minimum value
  Integer max1;    // Maximum value
  Integer sum1;    // Sum of all elements

equation
  // Compute absolute values
  for i in 1:n loop
    abs1[i] = abs(data[i]);
  end for;

  // Compute minimum value
  min1 = min(data);

  // Compute maximum value
  max1 = max(data);

  // Compute sum of all elements
  sum1 = sum(data);
end ArrayExample;