model NotEqual
  extends IndustrialControlSystems.Logical.Comparisons.RealType.Interfaces.RealComparison(final outputType = Boolean);
  parameter Real eps = 1e-6 "Small threshold for comparison";
  parameter Real Ts = 0 "Sample time for comparison";
equation
  if Ts > 0 then
    y = notEqual(u1, u2, eps, Ts);
  else
    y = notEqual(u1, u2, eps);
  end if;
end NotEqual;