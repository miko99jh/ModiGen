model Test_LeadLag
  IndustrialControlSystems.LinearSystems.Continuous.LeadLag leadlag(T1=2,T2=3,mu=2,y_start=0);
  Modelica.Blocks.Sources.Step stepSignal(height=2, startTime=10);
equation
  connect(stepSignal.y,leadlag.u);
end Test_LeadLag;
