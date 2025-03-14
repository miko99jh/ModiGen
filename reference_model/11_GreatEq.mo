model GreatEq1 "Greather or equal (>=)"
  extends IndustrialControlSystems.Logical.Comparisons.IntegerType.Interfaces.IntComparison;
equation
  if Ts > 0 then
    when sample(0,Ts) then
      y = if (u1 >= u2) then true else false;
    end when;
  else
     y = if (u1 >= u2) then true else false;
  end if;
end GreatEq1;
