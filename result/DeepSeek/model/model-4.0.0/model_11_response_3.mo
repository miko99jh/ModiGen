model GreatEq
  extends IndustrialControlSystems.Logical.Comparisons.IntegerType.Interfaces.IntComparison(redeclare input Integer u1, redeclare input Integer u2, redeclare output Boolean y);
equation
  if Ts > 0 then
    y = if sample(u1, u2, Ts) >= 0 then true else false;
  else
    y = if u1 >= u2 then true else false;
  end if;
end GreatEq;