model Test_Delay_Dis1
  IndustrialControlSystems.LinearSystems.Discrete.Delay delay(Ts=0.1, y_start=0);
  Modelica.Blocks.Sources.Sine sine(amplitude=2, offset=2, startTime=2, f=0.2);
equation
  connect(sine.y,delay.u);
end Test_Delay_Dis1;
