model Add
 extends IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;

  parameter Real Ts = 0 "Sampling time";

  // Additional inputs
  input Integer u1 "First integer input";
  input Integer u2 "Second integer input";

protected 
  Integer sum;

equation 
  if Ts > 0 then
    when sample(0, Ts) then
      sum = u1 + u2;
    end when;
  else
    sum = u1 + u2;
  end if;

  y = sum;

end Add;