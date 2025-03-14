model Test_Timer_OffDelay_Redge1
  IndustrialControlSystems.Logical.Timers.Timer_OffDelay_Redge timer;
  Modelica.Blocks.Sources.BooleanTable SetSignal(table={0.5,0.6,17,17.1});
  Modelica.Blocks.Sources.BooleanTable ResetSignal(table={5,5.1,30,30.1});
  Modelica.Blocks.Sources.Constant timerVALUE(k=10);
equation
  connect(SetSignal.y,timer.S);
  connect(ResetSignal.y,timer.R);
  connect(timerVALUE.y,timer.PV);
end Test_Timer_OffDelay_Redge1;
