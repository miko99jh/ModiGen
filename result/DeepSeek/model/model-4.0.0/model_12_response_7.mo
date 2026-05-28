model NotEqual
  extends IndustrialControlSystems.Logical.Comparisons.RealType.Interfaces.RealComparison;
  parameter Real eps = 1e-6 "Small threshold for comparison";
equation
  if Ts > 0 then
    y = (abs(u1 - u2) > eps) and (time - lastEvent >= Ts);
  else
    y = abs(u1 - u2) > eps;
  end if;
end NotEqual;