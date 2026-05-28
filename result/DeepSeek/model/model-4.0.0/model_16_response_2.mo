function Mean extends IndustrialControlSystems.MathOperations.RealType.Functions.GeneralFunction;
  input Real u[:];
  output Real y;
  protected Integer n;
algorithm 
  n := size(u, 1);
  y := sum(u)/n;
end Mean;