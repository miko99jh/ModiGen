model Test_Equal
  IndustrialControlSystems.Logical.Comparisons.IntegerType.Equal equal(u1=5,u2=10,Ts=0.1);
  Boolean y;
equation
  y=equal.y;
end Test_Equal;
