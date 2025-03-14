model Test_NumberOfRequests1
  IDEAS.Controls.Continuous.NumberOfRequests req(nin=2);
  Modelica.Blocks.Sources.Sine sin1(f=2);
  Modelica.Blocks.Sources.Pulse pulse(period=0.35);
equation
  connect(sin1.y,req. u[1]) ;
  connect(pulse.y,req. u[2]) ;
end Test_NumberOfRequests1;
