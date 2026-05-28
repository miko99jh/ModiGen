model Add
 extends IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;

  parameter Real Ts = 0 "Sampling time";

protected 
  Integer u1, u2;

equation
  // Assign inputs to u1 and u2
  u1 = u[1];
  u2 = u[2];

  // Conditional operation based on sampling time Ts
  if Ts > 0 then
    when sample(Ts, Ts) then
      y = u1 + u2;
    end when;
  else
    y = u1 + u2;
  end if;

end Add;