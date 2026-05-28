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
  
  // You can add a when statement to print the result if needed
  when initial() then
    // Print the result
    Modelica.Utilities.Streams.print("The sum of integers from 1 to " + String(n) + " is: " + String(sum));
  end when;
end Summation;