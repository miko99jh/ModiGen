model Test_LeadLag1
  PowerGrids.Controls.LeadLag leadLagModel(T1=4, T2=2, initType=Modelica.Blocks.Types.Init.SteadyState, k=10, yStart = Modelica.Constants.pi,noDynamics = false);  
  Modelica.Blocks.Sources.Step stepModel(height=1, offset=1, startTime=1) ;
equation
  connect(leadLagModel.u, stepModel.y);
end Test_LeadLag1;
