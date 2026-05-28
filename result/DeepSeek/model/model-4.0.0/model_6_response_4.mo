model TestTrackingFO
  extends Modelica.Icons.Example;
  parameter Real T = 0.4;
  parameter Real mu = 1;
  parameter Real Ymin = 0;
  parameter Real Ymax = 2;
  parameter Real height = 2;
  parameter Real startTime = 2;
  parameter Real width = 10;
  parameter Real period = 40;
  parameter Real amplitude = 5;
  parameter Real rising = 1;
  parameter Real width_trapezoid = 2;
  parameter Real falling = 1;
  parameter Real period_trapezoid = 8;
  parameter Integer nperiod_trapezoid = 1;
  parameter Real startTime_trapezoid = 4;
  IndustrialControlSystems.Controllers.Blocks.FO FO(
    T = T,
    mu = mu,
    AntiWindup = false,
    Ymin = Ymin,
    Ymax = Ymax);
  IndustrialControlSystems.Controllers.Blocks.FO FOtr(
    T = T,
    mu = mu,
    AntiWindup = false,
    useTS = true,
    Ymin = Ymin,
    Ymax = Ymax);
  IndustrialControlSystems.Controllers.Blocks.FO FOaw(
    T = T,
    mu = mu,
    AntiWindup = true,
    useTS = true,
    Ymin = Ymin,
    Ymax = Ymax);
  Modelica.Blocks.Sources.Step Signal(
    height = height,
    startTime = startTime);
  Modelica.Blocks.Sources.BooleanPulse TSsignal(
    width = width,
    period = period,
    startTime = startTime);
  Modelica.Blocks.Sources.Trapezoid TrackRef(
    amplitude = amplitude,
    rising = rising,
    width = width_trapezoid,
    falling = falling,
    period = period_trapezoid,
    nperiod = nperiod_trapezoid,
    startTime = startTime_trapezoid);
equation 
  connect(Signal.y, FO.u);
  connect(Signal.y, FOtr.u);
  connect(Signal.y, FOaw.u);
  connect(TSsignal.y, FOtr.TS);
  connect(TSsignal.y, FOaw.TS);
  connect(TrackRef.y, FOtr.TR);
  connect(TrackRef.y, FOaw.TR);
end TestTrackingFO;