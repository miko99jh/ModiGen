model Test_SOPDT_overdamped1
  AES.ProcessBlocks.SOPDT_overdamped sop(T2=3, T1=2, mu=1);
  Modelica.Blocks.Sources.RealExpression realExpression(y = if time < 1 then 0 else 1);
equation
  connect(realExpression.y, sop.u);
end Test_SOPDT_overdamped1;
