model Xnor "Model of a n-bit XNOR"
  extends
    IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(
     nInput=2, final nOutput=1);
equation
  assert(nInput>=2,"nIinput must be higher than 2");

  if Ts > 0 then
    when sample(0,Ts) then
      y[1] = not IndustrialControlSystems.Logical.LogicalOperations.Functions.Xor(u[:], nInput);
  end when;
  else
     y[1] = not IndustrialControlSystems.Logical.LogicalOperations.Functions.Xor(u[:], nInput);
  end if;
end Xnor;
