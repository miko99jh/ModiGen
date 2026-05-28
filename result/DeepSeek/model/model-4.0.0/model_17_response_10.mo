model Add
  extends IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;
  parameter Integer u1(start=0) "First integer input";
  parameter Integer u2(start=0) "Second integer input";
  parameter Integer y(start=0) "Output";
  parameter Real Ts(start=0) "Sampling time";
equation
  if Ts > 0 then
    der(y) = (u1 + u2) / Ts;
  else
    y = u1 + u2;
  end if;
end Add;