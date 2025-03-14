model Test_Sub
  IndustrialControlSystems.MathOperations.IntegerType.Sub sub(u1=5,u2=10,Ts=0.1);
  Integer y;
equation
  y=sub.y;
end Test_Sub;
