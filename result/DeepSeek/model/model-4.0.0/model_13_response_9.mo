model Xnor
  extends IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(nInput=2, nOutput=1);
  parameter Integer n=nInput;
equation
  assert(n>=2, "Number of inputs should be at least 2");
  when sample(0, Ts) then
    y[1] = not Functions.Xor(u[:], nInput);
  else
    y[1] = not Functions.Xor(u[:], nInput);
  end when;
end Xnor;