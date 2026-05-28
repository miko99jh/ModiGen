model NotEqual
 extends IndustrialControlSystems.Logical.Comparisons.RealType.Interfaces.RealComparison;

  parameter Real Ts = 0 "Sample time (s), 0 for continuous comparison";
  parameter Real eps = 1e-6 "Threshold for equality comparison";

protected 
  Boolean trigger "Internal trigger for sampled comparison";

equation 
  if Ts > 0 then
    when sample(0, Ts) then
      trigger = true;
    end when;
  else
    trigger = true;
  end if;

  if trigger then
    y = abs(u1 - u2) >= eps;
  end if;

end NotEqual;