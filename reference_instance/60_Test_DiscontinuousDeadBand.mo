model Test_DiscontinuousDeadBand1
  PowerGrids.Controls.DiscontinuousDeadBand discDeadBand(uMax = 1);
  Modelica.Blocks.Sources.RealExpression realExpression(y = time - 2);
equation
  connect(realExpression.y, discDeadBand.u);
end Test_DiscontinuousDeadBand1;
