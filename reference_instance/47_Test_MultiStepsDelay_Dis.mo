model Test_MultiStepsDelay_Dis1
  IndustrialControlSystems.LinearSystems.Discrete.MultiStepsDelay multiStepsDelay(Ts=0.1, N=2, y_start=0);
  Modelica.Blocks.Sources.Sine sine(amplitude=2, offset=2, startTime=2, f=0.2);
equation
  connect(sine.y,multiStepsDelay.u);
end Test_MultiStepsDelay_Dis1;
