model ArrayExample1
  parameter Integer n = 5;
  Real data[n] = {1, 2, 3, 4, 5}; // Define an array of real numbers of size n and initialize it.
  Real abs1[n],sum1,min1,max1;
equation
  abs1 = abs(data); // Computes the absolute value of array elements.
  min1 = min(data); // Computes the minimum value of array elements.
  max1 = max(data); // Computes the maximum value of array elements.
  sum1 = sum(data); // Computes the sum of array elements.
end ArrayExample1;
