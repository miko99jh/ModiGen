model Test_Timer_OffDelay_Fedge1
  IndustrialControlSystems.Logical.Timers.Timer_OffDelay_Fedge timer;
  Modelica.Blocks.Sources.BooleanTable SetSignal(table={0.5,1,8,9});
  Modelica.Blocks.Sources.BooleanTable ResetSignal(table={5,6,30});
  Modelica.Blocks.Sources.Constant timerVALUE(k=10);
equation
  connect(SetSignal.y, timer.S);  
  connect(ResetSignal.y, timer.R);
  connect(timerVALUE.y, timer.PV);
end Test_Timer_OffDelay_Fedge1;
