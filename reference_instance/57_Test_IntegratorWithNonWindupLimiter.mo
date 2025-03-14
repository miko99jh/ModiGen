model Test_IntegratorWithNonWindupLimiter
  PowerGrids.Controls.IntegratorWithNonWindupLimiter integratorWithNonWindupLimiter(
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    k=2,
    yMax=4);
  Modelica.Blocks.Sources.TimeTable signal(
    startTime=0,
    table=[0, 0; 1, 0; 1, 1; 5, 1; 5, -1; 100, -1]);
equation
  connect(signal.y, integratorWithNonWindupLimiter.u);
end Test_IntegratorWithNonWindupLimiter;
