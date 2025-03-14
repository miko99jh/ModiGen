model Test_Not1
  IndustrialControlSystems.Logical.LogicalOperations.Not negation;
  Boolean u1[1]={false};
  Boolean y[1];
equation
  negation.u = u1;
  negation.y = y;
end Test_Not1;
