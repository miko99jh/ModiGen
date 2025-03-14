model Test_RealGreatEq
  IndustrialControlSystems.Logical.Comparisons.RealType.GreatEq greateq(Ts=0.001,eps=0.01);
  Modelica.Blocks.Sources.Sine Sine(f=1, amplitude=1);
  Modelica.Blocks.Sources.Cosine Cosine(f=1, amplitude=1, phase=1.57);
  Boolean y;
equation
  connect(greateq.u1, Sine.y) ;
  connect(greateq.u2, Cosine.y) ;
  y=greateq.y;
end Test_RealGreatEq;
