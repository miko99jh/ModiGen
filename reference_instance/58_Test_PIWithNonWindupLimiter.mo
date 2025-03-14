model Test_PIWithNonWindupLimiter
  PowerGrids.Controls.PIWithNonWindupLimiter pidFilter(
    Ki = 4, 
    Kp = 2, 
    initType = Modelica.Blocks.Types.Init.InitialOutput, 
    yMax = 10);
  Modelica.Blocks.Sources.TimeTable inputSignal(
    table = [0, 0; 1, 0; 1, 1; 5, 1; 5, -1; 100, -1]);
equation
  connect(inputSignal.y, pidFilter.u);
end Test_PIWithNonWindupLimiter;
