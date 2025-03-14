model Test_FirstOrderWithNonWindupLimiter1
  PowerGrids.Controls.FirstOrderWithNonWindupLimiter FirstOrderWithNonWindupLimiter(k = 2, T = 2, initType = Modelica.Blocks.Types.Init.SteadyState, yMax = 5, yMin = -5, yStart = 2);
Modelica.Blocks.Sources.TimeTable table(table = [0, 1; 1, 1; 1, 4; 10, 4; 10, -4; 100, -4]);
equation
  connect(table.y, FirstOrderWithNonWindupLimiter.u) ;
end Test_FirstOrderWithNonWindupLimiter1;
