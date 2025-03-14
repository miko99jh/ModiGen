model NotEqual "not equal (!=)"
  extends IndustrialControlSystems.Logical.Comparisons.RealType.Interfaces.RealComparison;
equation
  if Ts > 0 then
    when sample(0,Ts) then
      y = if abs(u1 - u2)<eps then false else true;
    end when;
  else
     y = if abs(u1 - u2)<eps then false else true;
  end if;
end NotEqual;
