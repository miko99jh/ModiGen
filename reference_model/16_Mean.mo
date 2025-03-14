function Mean1
  extends IndustrialControlSystems.MathOperations.RealType.Functions.GeneralFunction;
protected
  Integer n;
algorithm
  n :=size(u,1);

  y := sum(u[i] for i in 1:n)/n;
end Mean1;
