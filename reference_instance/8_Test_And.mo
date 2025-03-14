model Test_And1
  IndustrialControlSystems.Logical.LogicalOperations.And andLogic(nInput=2);
  Boolean y[1];
equation
  andLogic.u[1]=false;
  andLogic.u[2]=true;
  y=andLogic.y;
end Test_And1;
