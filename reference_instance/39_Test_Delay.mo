model Test_Delay1
  IndustrialControlSystems.LinearSystems.Continuous.Delay delay2;
  Modelica.Blocks.Sources.Sine sine(amplitude=2, offset=2, startTime=2, f=0.2);
equation
  connect(delay2.u,sine.y);
end Test_Delay1;
