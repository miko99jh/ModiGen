model Test_Less
  IndustrialControlSystems.Logical.Comparisons.IntegerType.Less less(u1=5,u2=10,Ts=0.1);
  Boolean y;
equation
  y=less.y;
end Test_Less;
