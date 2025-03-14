model Test_Xor
  IndustrialControlSystems.Logical.LogicalOperations.Xor xor(Ts=0.1);
  Boolean u1[2]={false, true};
  Boolean y[1];
equation
  xor.u=u1;
  y=xor.y;
end Test_Xor;
