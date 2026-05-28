model Add
  extends IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;
  parameter Integer u1(start=0) "First integer input";
  parameter Integer u2(start=0) "Second integer input";
  output Integer y "Sum of u1 and u2";
equation
  if Ts > 0 then
    der(y) = (u1 + u2);
  else
    y = u1 + u2;
  end if;
end Add;