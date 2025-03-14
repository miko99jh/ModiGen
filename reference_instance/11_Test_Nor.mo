model Test_Nor
  IndustrialControlSystems.Logical.LogicalOperations.Nor nor(nInput=2);
  Boolean y[1];
equation
  nor.u[1]=false;
  nor.u[2]=true;
  y=nor.y;
end Test_Nor;
