model Add "Sum of two integer numbers"
  extends
    IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;
equation
  if Ts > 0 then
    when sample(0,Ts) then
      y = u1 + u2;
    end when;
  else
     y = u1 + u2;
  end if;
end Add;
