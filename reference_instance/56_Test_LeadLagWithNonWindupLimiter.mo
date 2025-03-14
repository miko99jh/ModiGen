model Test_LeadLagWithNonWindupLimiter
  PowerGrids.Controls.LeadLagWithNonWindupLimiter leadlag_test(
    T1 = 1,
    T2 = 2,
    initType = Modelica.Blocks.Types.Init.SteadyState,
    k = 2,
    yMax = 5,
    yMin = -5,
    yStart = 2);
  Modelica.Blocks.Sources.TimeTable timetable(table = [0, 1; 1, 1; 1, 4; 10, 4; 10, -4; 100, -4]);
equation
  connect(timetable.y, leadlag_test.u);
end Test_LeadLagWithNonWindupLimiter;
