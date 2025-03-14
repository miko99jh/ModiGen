model Test_GreatEq
  GreatEq1 greatEq(u1=15,u2=10,Ts=0.1);
  Boolean y;
equation
  y=greatEq.y;
end Test_GreatEq;
