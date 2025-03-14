model Test_Xnor
  Xnor xnor(Ts=0.1);
  Boolean u1[2]={false, true};
  Boolean y;
equation
  xnor.u=u1;
  y=xnor.y[1];
end Test_Xnor;
