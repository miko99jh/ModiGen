model Test_RealLess1
  IndustrialControlSystems.Logical.Comparisons.RealType.Less less(eps=0.01,Ts=0.001);
  Modelica.Blocks.Sources.Sine Sine(f=1,amplitude=1);
  Modelica.Blocks.Sources.Cosine Cosine(f=1,amplitude=1,phase=1.57);
equation
  connect(Sine.y, less.u1) ;
  connect(Cosine.y, less.u2) ;
end Test_RealLess1;
