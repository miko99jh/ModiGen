model TestTrackingFO "Tracking test mode for FO block"
  extends Modelica.Icons.Example;

  IndustrialControlSystems.Controllers.Blocks.FO FOtr(useTS=true, T=0.4)
    annotation (Placement(transformation(extent={{-44,-24},{-22,-2}})));
  IndustrialControlSystems.Controllers.Blocks.FO FOaw(
    mu=1,
    AntiWindup=true,
    T=0.4,
    useTS=true,
    Ymin=0,
    Ymax=2);
  Modelica.Blocks.Sources.Step signal(startTime=2, height=2);
  Modelica.Blocks.Sources.BooleanPulse TSsignal(
    startTime=4,
    width=10,
    period=40);
  Modelica.Blocks.Sources.Trapezoid TrackRef(
    amplitude=5,
    rising=1,
    width=2,
    falling=1,
    period=8,
    nperiod=1,
    startTime=4);
  IndustrialControlSystems.Controllers.Blocks.FO FO(mu=1, T=0.4);
equation
  connect(signal.y, FO.u);
  connect(TSsignal.y, FOtr.TS);
  connect(TrackRef.y, FOtr.TR);
  connect(signal.y, FOtr.u);
  connect(signal.y, FOaw.u);
  connect(TSsignal.y, FOaw.TS);
  connect(TrackRef.y, FOaw.TR);
end TestTrackingFO;
