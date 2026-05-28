model GreatEq
 extends IndustrialControlSystems.Logical.Comparisons.IntegerType.Interfaces.IntComparison;

  parameter Real Ts = 0 "Sample time, if Ts > 0, the comparison is triggered at regular intervals";

protected 
  Boolean ySampled;

equation 
  if Ts > 0 then
    when sample(0, Ts) then
      ySampled = u1 >= u2;
    end when;
    y = ySampled;
  else
    y = u1 >= u2;
  end if;

end GreatEq;