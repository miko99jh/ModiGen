model Test_Mult
  IndustrialControlSystems.MathOperations.IntegerType.Mult mult(u1=5,u2=10,Ts=0.1);
  Integer y;
equation
  y=mult.y;
end Test_Mult;
