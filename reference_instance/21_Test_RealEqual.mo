model Test_RealEqual1
  IndustrialControlSystems.Logical.Comparisons.RealType.Equal equal1(eps=0.01,Ts=0.001);
  Modelica.Blocks.Sources.Sine sine(amplitude=1, f=1);
  Modelica.Blocks.Sources.Cosine cosine(amplitude=1, f=1, phase=1.57);
equation
  connect(sine.y, equal1.u1);
  connect(cosine.y, equal1.u2);
end Test_RealEqual1;
