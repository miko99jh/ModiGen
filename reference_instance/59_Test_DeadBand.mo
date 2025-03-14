model Test_DeadBand
  PowerGrids.Controls.DeadBand deadBand(smoothed = false, uMax = 1);
  Modelica.Blocks.Sources.RealExpression inputSignal(y = time - 2);
equation
  connect(inputSignal.y, deadBand.u);
end Test_DeadBand;
