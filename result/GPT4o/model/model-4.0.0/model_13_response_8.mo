model Xnor
 extends IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(
    nInput=2, final nOutput=1);

  parameter Real Ts = 0 "Sample time";

equation
  assert(nInput >= 2, "The number of inputs must be at least 2.");

  if Ts > 0 then
    when sample(0, Ts) then
      y[1] = not Functions.Xor(u[:], nInput);
    end when;
  else
    y[1] = not Functions.Xor(u[:], nInput);
  end if;
end Xnor;