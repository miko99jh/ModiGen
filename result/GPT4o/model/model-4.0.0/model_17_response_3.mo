model Add
 extends IndustrialControlSystems.MathOperations.IntegerType.Interfaces.IntSimpleOperation;

  // Parameters
  parameter Real Ts = 0 "Sampling time";

  // Inputs
  input Integer u1 "First integer input";
  input Integer u2 "Second integer input";

protected 
  Integer sum "Sum of inputs";

equation 
  // Conditional operation based on sampling time Ts
  if Ts > 0 then
    when sample(0, Ts) then
      sum = u1 + u2;
    end when;
  else
    sum = u1 + u2;
  end if;

  // Output assignment
  y = sum;

end Add;