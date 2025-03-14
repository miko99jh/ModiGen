model Test_LeadMOrderLag
  PowerGrids.Controls.LeadMOrderLag leadMOrderLag(M=100, T1=1e-5, T2=1/100, initType=Modelica.Blocks.Types.Init.SteadyState, k=1, yStart=1);
  Modelica.Blocks.Sources.Step signal(height=1, offset=1, startTime=1);
equation
  connect(signal.y, leadMOrderLag.u);
end Test_LeadMOrderLag;
