model TestTrackingFO
  extends Modelica.Icons.Example;
  //FO controller block
  IndustrialControlSystems.Controllers.Blocks.FO FO(
    mu=1,
    T=0.4,
    useTS=true,
    Ymin=Modelica.SIunits.Conversions.fromPa(0),
    Ymax=Modelica.SIunits.Conversions.fromPa(2)
  );
  //FO controller block with anti-windup
  IndustrialControlSystems.Controllers.Blocks.FO FOaw(
    mu=1,
    AntiWindup=true,
    T=0.4,
    useTS=true,
    Ymin=Modelica.SIunits.Conversions.fromPa(0),
    Ymax=Modelica.SIunits.Conversions.fromPa(2)
  );
  //Signal
  Modelica.Blocks.Sources.Step Signal(height=2, startTime=2);
  //TSsignal
  Modelica.Blocks.Sources.BooleanPulse TSsignal(startTime=4, width=10, period=40);
  //TrackRef
  Modelica.Blocks.Sources.Trapezoid TrackRef(
    amplitude=5,
    rising=1,
    width=2,
    falling=1,
    period=8,
    nperiod=1,
    startTime=4
  );
  //FO controller block
  IndustrialControlSystems.Controllers.Blocks.FO FO2(mu=1, T=0.4);
equation 
  //connections
  connect(Signal.y, FO.u);
  connect(Signal.y, FOaw.u);
  connect(Signal.y, FO2.u);
  connect(TSsignal.y, FO.TS);
  connect(TSsignal.y, FOaw.TS);
  connect(TrackRef.y, FOtr.TR);
  connect(TrackRef.y, FOaw.TR);
end TestTrackingFO;