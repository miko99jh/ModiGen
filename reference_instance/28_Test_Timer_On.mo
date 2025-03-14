model Test_Timer_On1
  IndustrialControlSystems.Logical.Timers.Timer_On timer1;
  Modelica.Blocks.Sources.Constant timerVALUE(k=30);
  Modelica.Blocks.Sources.BooleanTable SetSignal(table={0.5,4,6.5});
  Modelica.Blocks.Sources.BooleanTable ResetSignal(table={5,6.5});
equation
  connect(SetSignal.y,timer1.S);
  connect(ResetSignal.y,timer1.R);
  connect(timerVALUE.y,timer1.PV);
end Test_Timer_On1;
