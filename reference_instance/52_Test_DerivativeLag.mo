model Test_DerivativeLag1
  PowerGrids.Controls.DerivativeLag derivativeLag(Td = 4, T1 = 2, initType = Modelica.Blocks.Types.Init.SteadyState);
  Modelica.Blocks.Sources.Step step(startTime = 1, offset = 1);
equation
  connect(step.y, derivativeLag.u);
end Test_DerivativeLag1;
