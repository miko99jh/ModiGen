model Test_OffTimer1
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=0.2);
  IDEAS.Controls.Continuous.OffTimer offTim1;
  Modelica.Blocks.Logical.Not not1;
equation
  connect(booleanPulse.y, not1.u);
  connect(offTim1.u, not1.y);
end Test_OffTimer1;
