model Test_Counter
  IndustrialControlSystems.Logical.Counter.Counter counter(Max=31,PV = 5, Ts=0.1);
  Modelica.Blocks.Sources.BooleanTable counterUp(startValue=false, table={10,11,12,13,14,15,16,17,18,19,20,21});
  Modelica.Blocks.Sources.BooleanTable counterDown(startValue=false, table={25,26,27,28,29,30});
  Modelica.Blocks.Sources.BooleanTable set(startValue=false, table={1,40,55});
  Modelica.Blocks.Sources.BooleanTable reset(startValue=false, table={50,51});
equation
  connect(counterUp.y, counter.CU);
  connect(counterDown.y, counter.CD);
  connect(set.y, counter.S);
  connect(reset.y, counter.R);
end Test_Counter;
