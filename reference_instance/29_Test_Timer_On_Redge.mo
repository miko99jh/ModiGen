model Test_Timer_On_Redge1
  IndustrialControlSystems.Logical.Timers.Timer_On_Redge timer;
  Modelica.Blocks.Sources.BooleanTable SetSignal(table={0.5,0.6,7,7.1,12,12.1});
  Modelica.Blocks.Sources.BooleanTable ResetSignal(table={5,5.1});
  Modelica.Blocks.Sources.Constant timerVALUE(k=30);
equation
  connect(SetSignal.y, timer.S);
  connect(ResetSignal.y, timer.R);
  connect(timerVALUE.y, timer.PV);
end Test_Timer_On_Redge1;
