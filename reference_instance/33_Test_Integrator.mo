model Test_Integrator
  IndustrialControlSystems.LinearSystems.Continuous.Integrator integrator(mu=0.04, y_start=1);
  Modelica.Blocks.Sources.Step stepSignal(startTime=10, height=2);
equation
  connect(stepSignal.y, integrator.u);
end Test_Integrator;
