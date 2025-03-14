model Test_LimiterWithLag
  PowerGrids.Controls.LimiterWithLag LimiterWithLag1(
    LagMin = 3, 
    LagMax = 2, 
    uMax = 0.7, 
    uMin = 0.3);
  Modelica.Blocks.Sources.Trapezoid LfSignal(
    falling = 0.5, 
    nperiod = 2, 
    rising = 0.5, 
    period = 10, 
    width = 4);
  Modelica.Blocks.Sources.Trapezoid HfSignal(
    falling = 0.5, 
    nperiod = 4, 
    period = 4, 
    rising = 0.5, 
    startTime = 20, 
    width = 1);
  Modelica.Blocks.Math.Sum sum1(nin = 2);
equation
  connect(LfSignal.y, sum1.u[1]);
  connect(HfSignal.y, sum1.u[2]);
  connect(sum1.y, LimiterWithLag1.u);
end Test_LimiterWithLag;
