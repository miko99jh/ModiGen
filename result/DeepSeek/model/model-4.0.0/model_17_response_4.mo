model Add
  extends IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;
  parameter Integer u1(start=0);
  parameter Integer u2(start=0);
  output Integer y;

equation
  if Ts > 0 then
    der(y) = (u1 + u2 - y)/Ts;
  else
    y = u1 + u2;
  end if;
end Add;