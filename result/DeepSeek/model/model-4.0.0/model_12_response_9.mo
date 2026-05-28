model NotEqual
  extends IndustrialControlSystems.Logical.Comparisons.RealType.Interfaces.RealComparison;
  parameter Real eps=1e-6;
  parameter Real Ts=0;
equation
  if Ts > 0 then
    y = not(abs(u1 - u2) < eps);
  else
    der(y) = (not(abs(u1 - u2) < eps)) - y;
  end if;
end NotEqual;