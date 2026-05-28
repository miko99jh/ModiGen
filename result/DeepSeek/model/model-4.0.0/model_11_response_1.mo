model GreatEq
  extends IndustrialControlSystems.Logical.Comparisons.IntegerType.Interfaces.IntComparison;
equation
  if Ts > 0 then
    y = (time >= Ts) and (u1 >= u2);
  else
    y = u1 >= u2;
  end if;
end GreatEq;