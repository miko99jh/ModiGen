model Test_BooleanDelay1
  IDEAS.Controls.Discrete.BooleanDelay booleanDelay(y(fixed=true), samplePeriod=0.05);
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=0.1, startTime=0.01, width=50);
equation
  connect(booleanPulse.y, booleanDelay.u);
end Test_BooleanDelay1;
