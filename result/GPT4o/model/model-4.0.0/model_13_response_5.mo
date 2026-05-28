model Xnor
 extends IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(
    nInput=2, final nOutput=1);

  parameter Real Ts = 0 "Sample time";

equation
  assert(nInput >= 2, "nInput must be greater than or equal to 2");

  if Ts > 0 then
    when sample(0, Ts) then
      y[1] = not Functions.Xor(u[:], nInput);
    end when;
  else
    y[1] = not Functions.Xor(u[:], nInput);
  end if;
end Xnor;