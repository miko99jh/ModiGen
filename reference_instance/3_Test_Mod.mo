model Test_Mod
  IndustrialControlSystems.MathOperations.IntegerType.Mod mod(u1=5,u2=10,Ts=0.1);
  Integer y;
equation
  y=mod.y;
end Test_Mod;
