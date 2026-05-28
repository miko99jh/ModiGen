model NotEqual
  extends IndustrialControlSystems.Logical.Comparisons.RealType.Interfaces.RealComparison;

equation
  if (abs(u1 - u2) < eps) then
    y = false;
  else
    y = true;
  end if;
end NotEqual;