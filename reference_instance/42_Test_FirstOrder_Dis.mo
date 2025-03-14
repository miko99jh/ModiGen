model Test_FirstOrder_Dis
  IndustrialControlSystems.LinearSystems.Discrete.FirstOrder firstOrder(mu=2,tau=3,y_start=0,Ts=0.5);
  Modelica.Blocks.Sources.Step stepSignal(height=2,startTime=10);
equation
  connect(stepSignal.y, firstOrder.u);
end Test_FirstOrder_Dis;
