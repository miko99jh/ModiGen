model TestTrackingFO
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step Signal(height=2, startTime=2);
  Modelica.Blocks.Sources.BooleanPulse TSsignal(startTime=4, width=10, period=40);
  Modelica.Blocks.Sources.Trapezoid TrackRef(amplitude=5, rising=1, width=2, falling=1, period=8, nperiod=1, startTime=4);
  IndustrialControlSystems.Controllers.Blocks.FO FO(mu=1, T=0.4);
  IndustrialControlSystems.Controllers.Blocks.FO FOtr(mu=1, T=0.4, useTS=true);
  IndustrialControlSystems.Controllers.Blocks.FO FOaw(mu=1, T=0.4, useTS=true, Ymin=0, Ymax=2);
equation 
  connect(Signal.y, FO.u);
  connect(FO.y, FOtr.u);
  connect(FO.y, FOaw.u);
  connect(TSsignal.y, FOtr.TS);
  connect(TSsignal.y, FOaw.TS);
  connect(TrackRef.y, FOtr.TR);
  connect(TrackRef.y, FOaw.TR);
end TestTrackingFO;