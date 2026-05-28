model GreatEq
  extends IndustrialControlSystems.Logical.Comparisons.IntegerType.Interfaces.IntComparison(redeclare input Integer u1, redeclare input Integer u2, redeclare output Boolean y);
equation
  if Ts > 0 then
    y = (time >= Ts) and (u1 >= u2);
  else
    y = u1 >= u2;
  end if;
end GreatEq;