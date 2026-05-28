model Add
  extends IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;
  parameter Integer u1;
  parameter Integer u2;
  output Integer y;
equation
  if Ts > 0 then
    der(y) = (u1 + u2);
  else
    y = u1 + u2;
  end if;
end Add;