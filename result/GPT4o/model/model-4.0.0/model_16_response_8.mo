function Mean
 extends IndustrialControlSystems.MathOperations.RealType.Functions.GeneralFunction;
protected
  Integer n;
algorithm
  n := size(u, 1); // Determine the number of elements in the vector u
  y := sum(u) / n; // Compute the mean by dividing the sum of elements by n
end Mean;