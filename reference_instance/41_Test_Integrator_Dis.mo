model Test_Integrator_Dis
  IndustrialControlSystems.LinearSystems.Discrete.Integrator integrator(mu=0.04,y_start=1,Ts=0.5);
  Modelica.Blocks.Sources.Step stepSignal(height=2, startTime=10);
equation
  connect(stepSignal.y,integrator.u);
end Test_Integrator_Dis;
