model NotEqual
 extends IndustrialControlSystems.Logical.Comparisons.RealType.Interfaces.RealComparison;

  parameter Real Ts = 0 "Sample time for discrete comparison, 0 for continuous";
  parameter Real eps = 1e-6 "Threshold for determining equality";

protected 
  Boolean pre_y;

equation 
  when Ts > 0 then
    // Discrete comparison
    when sample(0, Ts) then
      y = abs(u1 - u2) >= eps;
    end when;
  else
    // Continuous comparison
    y = abs(u1 - u2) >= eps;
  end when;

end NotEqual;