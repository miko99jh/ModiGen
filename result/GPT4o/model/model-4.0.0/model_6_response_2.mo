model TestTrackingFO
 // Import necessary packages
  import IndustrialControlSystems.Controllers.Blocks.FO;
  import Modelica.Blocks.Sources.Step;
  import Modelica.Blocks.Sources.BooleanPulse;
  import Modelica.Blocks.Sources.Trapezoid;

  // Components
  FO FOtr(useTS=true, T=0.4) "Fractional Order controller with tracking";
  FO FOaw(mu=1, AntiWindup=true, T=0.4, useTS=true, Ymin=0, Ymax=2) "Fractional Order controller with anti-windup and tracking";
  FO FO(mu=1, T=0.4) "Standard Fractional Order controller";
  
  Step Signal(startTime=2, height=2) "Step signal source";
  BooleanPulse TSsignal(startTime=4, width=10, period=40) "Boolean pulse signal for tracking mode switch";
  Trapezoid TrackRef(amplitude=5, rising=1, width=2, falling=1, period=8, nperiod=1, startTime=4) "Trapezoidal reference signal for tracking";

equation
  // Connect step signal to control inputs of FO controllers
  connect(Signal.y, FOtr.u);
  connect(Signal.y, FOaw.u);
  connect(Signal.y, FO.u);

  // Connect boolean pulse to tracking mode switches of tracking-enabled FO controllers
  connect(TSsignal.y, FOtr.TS);
  connect(TSsignal.y, FOaw.TS);

  // Connect trapezoidal reference signal to tracking references of tracking-enabled FO controllers
  connect(TrackRef.y, FOtr.TR);
  connect(TrackRef.y, FOaw.TR);
  
end TestTrackingFO;