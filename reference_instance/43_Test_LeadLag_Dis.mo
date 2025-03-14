model Test_LeadLag_Dis1
  IndustrialControlSystems.LinearSystems.Discrete.LeadLag leadLag(T1=2, T2=3, mu=2, y_start=0, Ts=0.5);
  Modelica.Blocks.Sources.Step stepSignal(height=2, startTime=10);
equation
  connect(stepSignal.y, leadLag.u) ;
end Test_LeadLag_Dis1;
