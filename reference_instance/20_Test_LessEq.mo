model Test_LessEq
  IndustrialControlSystems.Logical.Comparisons.IntegerType.LessEq less_eq(Ts=0.1,u2=10,u1=5);
  Boolean y;
equation
  y = less_eq.y;
end Test_LessEq;
