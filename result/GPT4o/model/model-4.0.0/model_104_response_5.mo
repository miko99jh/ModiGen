model Summation
 // Declare variables
  Integer n = 10; // Upper limit of the summation
  Integer sum;    // Variable to store the sum

algorithm
  // Initialize sum
  sum := 0;

  // Loop to calculate the sum of integers from 1 to n
  for i in 1:n loop
    sum := sum + i;
  end for;
  
  // Display the result
  annotation (experiment(StartTime=0, StopTime=1, Tolerance=1e-6, Interval=0.1));
end Summation;