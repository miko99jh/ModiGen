model Test_GreatEq
  IndustrialControlSystems.Logical.Comparisons.IntegerType.GreatEq greatEq(u1=5,u2=10,Ts=0.1);
  Boolean y;
equation
  y=greatEq.y;
end Test_GreatEq;
