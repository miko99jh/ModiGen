model Test_Pow
  IndustrialControlSystems.MathOperations.IntegerType.Pow pow(u1=5,u2=10,Ts=0.1);
  Integer y;
equation
  y=pow.y;
end Test_Pow;
