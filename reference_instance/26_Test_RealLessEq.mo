model Test_RealLessEq
  IndustrialControlSystems.Logical.Comparisons.RealType.LessEq lessEq(Ts=0.001,eps=0.01);
  Modelica.Blocks.Sources.Sine sine(amplitude=1, f=1, phase=0);
  Modelica.Blocks.Sources.Cosine cosine(amplitude=1, f=1, phase=1.57);
equation
  connect(sine.y, lessEq.u1);
  connect(cosine.y, lessEq.u2);
end Test_RealLessEq;
