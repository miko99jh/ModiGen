model Test_FirstOrder1
  IndustrialControlSystems.LinearSystems.Continuous.FirstOrder firstOrder1(tau=3, mu=2, y_start=0);
  Modelica.Blocks.Sources.Step stepSignal(startTime=10, height=2);
equation
    connect(firstOrder1.u, stepSignal.y);
end Test_FirstOrder1;
