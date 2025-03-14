model Test_RealNotEqual
  NotEqual ne(Ts=0.001,eps=0.01);
  Modelica.Blocks.Sources.Sine sine(f=1);
  Modelica.Blocks.Sources.Cosine cosine(f=1, amplitude = 1, phase = 1.57);
equation
  connect(sine.y,ne.u1) ;
  connect(cosine.y,ne.u2) ;
end Test_RealNotEqual;
