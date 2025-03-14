model Test_SmithDelay1
  IndustrialControlSystems.LinearSystems.Continuous.SmithDelay smithDelay(T=1);
  Modelica.Blocks.Sources.Sine sine(amplitude=2, offset=2, startTime=2, f=0.2);
equation
  connect(sine.y, smithDelay.u);
end Test_SmithDelay1;
