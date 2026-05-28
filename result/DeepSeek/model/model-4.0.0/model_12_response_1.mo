model NotEqual
  extends IndustrialControlSystems.Logical.Comparisons.RealType.Interfaces.RealComparison;
  parameter Real eps = 1e-6 "Small threshold for equality";
  parameter Real Ts = 0 "Sample time for comparison";
equation
  if Ts > 0 then
    y = not equal(u1, u2, eps, Ts);
  else
    y = not equal(u1, u2, eps);
  end if;
end NotEqual;