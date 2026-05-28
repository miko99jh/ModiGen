model Add
 extends IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;

  parameter Real Ts = 0 "Sampling time";

  Integer u1 "First integer input";
  Integer u2 "Second integer input";

equation
  if Ts > 0 then
    when sample(0, Ts) then
      y = u1 + u2;
    end when;
  else
    y = u1 + u2;
  end if;
end Add;