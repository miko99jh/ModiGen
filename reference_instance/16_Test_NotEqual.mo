model Test_NotEqual
  IndustrialControlSystems.Logical.Comparisons.IntegerType.NotEqual notequal(u1=5,u2=10,Ts=0.1);
  Boolean y;
equation
  y=notequal.y;
end Test_NotEqual;
