function Mean
  extends IndustrialControlSystems.MathOperations.RealType.Functions.GeneralFunction;
  input Real u[:];
  output Real y;
  protected Integer n = size(u, 1);
algorithm 
  y := sum(u)/n;
end Mean;