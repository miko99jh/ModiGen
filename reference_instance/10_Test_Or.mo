model Test_Or
  IndustrialControlSystems.Logical.LogicalOperations.Or logicOR(Ts=0.1);
  Boolean u1[2];
  Boolean y[1];
equation
  u1={false, true};
  logicOR.u=u1;
  y=logicOR.y;
end Test_Or;
