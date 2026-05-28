model NotEqual
 extends IndustrialControlSystems.Logical.Comparisons.RealType.Interfaces.RealComparison;

  parameter Real eps = 1e-6 "Threshold for comparison";
  parameter Real Ts = 0 "Sample time, Ts > 0 for discrete sampling";

protected 
  Boolean sampleTrigger;

equation 
  if Ts > 0 then
    when sample(Ts) then
      sampleTrigger = true;
    end when;
  else
    sampleTrigger = true;
  end if;

  when sampleTrigger then
    y = abs(u1 - u2) >= eps;
  end when;

end NotEqual;