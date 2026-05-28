model TestTrackingFO
  extends Modelica.Icons.Example;
  import Modelica.Blocks.Sources;
  import IndustrialControlSystems.Controllers.Blocks;
  Blocks.FO FO(mu=1, T=0.4, useTS=true) annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Blocks.FO FOtr(T=0.4, useTS=true) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Blocks.FO FOaw(mu=1, AntiWindup=true, T=0.4, useTS=true, Ymin=0, Ymax=2) annotation (Placement(transformation(extent={{-100,-90},{-80,-70}})));
  Sources.Step Signal(height=2, startTime=2) annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Sources.BooleanPulse TSsignal(width=10, period=40, startTime=4) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Sources.Trapezoid TrackRef(amplitude=5, rising=1, width=2, falling=1, period=8, nperiod=1, startTime=4) annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
  Blocks.FO FO2(mu=1, T=0.4) annotation (Placement(transformation(extent={{10,-90},{30,-70}})));
equation 
  connect(Signal.y, FO.u);
  connect(Signal.y, FOtr.u);
  connect(Signal.y, FOaw.u);
  connect(Signal.y, FO2.u);
  connect(TSsignal.y, FO.TS);
  connect(TSsignal.y, FOtr.TS);
  connect(TSsignal.y, FOaw.TS);
  connect(TrackRef.y, FOtr.TR);
  connect(TrackRef.y, FOaw.TR);
  connect(FO.y, FO2.u);
end TestTrackingFO;