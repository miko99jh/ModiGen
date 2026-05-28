model GreatEq
  extends IndustrialControlSystems.Logical.Comparisons.IntegerType.Interfaces.IntComparison(redeclare input Integer u1, redeclare input Integer u2);
equation
  if Ts > 0 then
    y = sample(u1 >= u2, Ts);
  else
    y = u1 >= u2;
  end if;
end GreatEq;