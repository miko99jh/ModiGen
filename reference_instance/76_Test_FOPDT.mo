model Test_FOPDT1
  AES.ProcessBlocks.FOPDT fOPDT1(mu = 1, T = 2);
Modelica.Blocks.Sources.RealExpression y(y = if time < 1 then 0 else 1);
equation
  connect(y.y, fOPDT1.u);
end Test_FOPDT1;
