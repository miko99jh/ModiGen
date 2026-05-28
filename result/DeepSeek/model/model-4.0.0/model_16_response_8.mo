function Mean
  extends IndustrialControlSystems.MathOperations.RealType.Functions.GeneralFunction;
  input Real u[n] "Input vector";
  output Real y "Mean of the input vector";
  protected Integer n "Number of elements in the input vector";
algorithm 
  n := size(u, 1);
  y := sum(u) / n;
end Mean;