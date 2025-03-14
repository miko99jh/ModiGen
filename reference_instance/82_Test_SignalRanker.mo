model Test_SignalRanker
  IDEAS.Controls.Continuous.SignalRanker signalRanker(nin=3);
  Modelica.Blocks.Sources.Sine sine(f=2, startTime=0.025);
  Modelica.Blocks.Sources.Pulse pulse(period=0.25);
  Modelica.Blocks.Sources.ExpSine expSine(f=10, damping=1);
equation
  connect(sine.y, signalRanker.u[1]);
  connect(pulse.y, signalRanker.u[2]);
  connect(expSine.y, signalRanker.u[3]);
end Test_SignalRanker;
