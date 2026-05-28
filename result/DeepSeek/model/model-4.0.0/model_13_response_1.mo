model Xnor
  extends IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(nInput=2, nOutput=1);
equation 
  assert(nInput>=2, "The number of inputs should be greater than or equal to 2.");
  when sample(0, Ts) then
    y[1] = not Functions.Xor(u[:], nInput);
  end when;
end Xnor;