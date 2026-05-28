model Xnor
  extends IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(nInput=2, nOutput=1);
equation
  assert(nInput>=2, "The number of inputs must be greater than or equal to 2");
  if Ts > 0 then
    when sample(0, Ts) then
      y[1] = not Functions.Xor(u[:], nInput);
  else
    y[1] = not Functions.Xor(u[:], nInput);
  end if;
end Xnor;