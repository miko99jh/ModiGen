model Add
  extends IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;
  parameter Integer u1(start=0) "First input";
  parameter Integer u2(start=0) "Second input";
  output Integer y "Output";
equation
  if Ts > 0 then
    der(y) = (u1 + u2);
  else
    y = u1 + u2;
  end if;
end Add;