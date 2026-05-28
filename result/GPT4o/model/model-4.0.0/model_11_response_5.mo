model GreatEq
 extends IndustrialControlSystems.Logical.Comparisons.IntegerType.Interfaces.IntComparison;

  parameter Real Ts = 0 "Sample time for triggering the comparison";

equation
  if Ts > 0 then
    when sample(0, Ts) then
      y = u1 >= u2;
    end when;
  else
    y = u1 >= u2;
  end if;
end GreatEq;