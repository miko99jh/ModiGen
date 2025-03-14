model Test_RealGreat1
  IndustrialControlSystems.Logical.Comparisons.RealType.Great great(Ts=0.001,eps=0.01);
  Modelica.Blocks.Sources.Sine Sine(f=1, amplitude=1);
  Modelica.Blocks.Sources.Cosine Cosine(f=1, amplitude=1, phase=1.57);
  Boolean y;
equation
  connect(great.u1, Sine.y) ;
  connect(great.u2, Cosine.y) ;
  y=great.y;
end Test_RealGreat1;
