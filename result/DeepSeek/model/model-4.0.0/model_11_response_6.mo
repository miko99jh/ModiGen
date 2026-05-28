model GreatEq
  extends IndustrialControlSystems.Logical.Comparisons.IntegerType.Interfaces.IntComparison(
    final quantity = "greater than or equal to (>=)");
equation
  if Ts > 0 then
    y = (time >= 0 and time < Ts) or (mod(time, Ts) == 0);
  else
    y = u1 >= u2;
  end if;
end GreatEq;