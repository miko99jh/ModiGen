model Test_RampTrackingFilter
  PowerGrids.Controls.RampTrackingFilter rampTrackingFilter(M = 2, N = 50, T1 = 1e-5, T2 = 1 / 100, initType = Modelica.Blocks.Types.Init.SteadyState, k = 10, yStart = 10);
    Modelica.Blocks.Sources.Step step(height = 1, offset = 1, startTime = 1);
equation
  connect(step.y, rampTrackingFilter.u);
end Test_RampTrackingFilter;
