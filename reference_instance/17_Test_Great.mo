model Test_Great
  IndustrialControlSystems.Logical.Comparisons.IntegerType.Great great(u1=5,u2=10,Ts=0.1);
  Boolean y;
equation
  y=great.y;
end Test_Great;
