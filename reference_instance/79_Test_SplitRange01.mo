model Test_SplitRange1
  AES.ControlBlocks.ActuationSchemes.SplitRange01 splitRange01;
  Modelica.Blocks.Sources.RealExpression CSi01(y = time - 5) ;
equation
  connect(CSi01.y,splitRange01.CSi01);
end Test_SplitRange1;
