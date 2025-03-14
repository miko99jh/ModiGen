model Test_TITO_rational_zeroInit
  AES.ProcessBlocks.TITO_rational_zeroInit TITO;
  Modelica.Blocks.Sources.RealExpression u1(y = if time < 10 then 0 else 1);
  Modelica.Blocks.Sources.RealExpression u2(y = if time < 1 then 0 else 1);
equation
  connect(TITO.u1,u1.y);
  connect(TITO.u2,u2.y);
end Test_TITO_rational_zeroInit;
