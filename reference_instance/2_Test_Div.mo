model Test_Div
  IndustrialControlSystems.MathOperations.IntegerType.Div div(u1=5,u2=10,Ts=0.1);
  Integer y;
equation
  y=div.y;
end Test_Div;
