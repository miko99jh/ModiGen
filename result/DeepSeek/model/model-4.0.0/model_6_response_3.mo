model TestTrackingFO
  extends Modelica.Icons.Example;
  import Modelica.Blocks.Sources;
  import IndustrialControlSystems.Controllers.Blocks;

  Blocks.FO FO(mu=1, T=0.4, useTS=true);
  Blocks.FO FOtr(mu=1, T=0.4, useTS=true);
  Blocks.FO FOaw(mu=1, AntiWindup=true, T=0.4, useTS=true, Ymin=0, Ymax=2);
  Sources.Step Signal(startTime=2);
  Sources.BooleanPulse TSsignal(startTime=4, width=10, period=40);
  Sources.Trapezoid TrackRef(amplitude=5, rising=1, width=2, falling=1, period=8, nperiod=1, startTime=4);
  Blocks.FO FO2(mu=1, T=0.4);

equation 
  connect(Signal.y, FO.u);
  connect(Signal.y, FOtr.u);
  connect(Signal.y, FOaw.u);
  connect(Signal.y, FO2.u);
  connect(TSsignal.y, FOtr.TS);
  connect(TSsignal.y, FOaw.TS);
  connect(TrackRef.y, FOtr.TR);
  connect(TrackRef.y, FOaw.TR);
end TestTrackingFO;