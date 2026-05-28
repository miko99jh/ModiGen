model Subtracter
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Voltage Vin=5 "Input voltage amplitude";
  parameter Modelica.Units.SI.Frequency f=10 "Input voltage frequency";
  Modelica.Electrical.Analog.Basic.Ground ground;
  Modelica.Electrical.Analog.Sources.SineVoltage vIn1(V=Vin, f=f);
  Modelica.Electrical.Analog.Sources.ConstantVoltage vIn2(V=Vin);
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut;
  Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.Feedback feedback(initiali=0);
equation 
  connect(vIn1.p, feedback.p1) annotation(Line(color={0,0,128}, smooth=Smooth.None));
  connect(vIn2.p, feedback.p1_2) annotation(Line(color={0,0,128}, smooth=Smooth.None));
  connect(ground.p, vIn1.n) annotation(Line(color={0,0,128}, smooth=Smooth.None));
  connect(ground.p, vIn2.n) annotation(Line(color={0,0,128}, smooth=Smooth.None));
  connect(feedback.n1, vIn2.n) annotation(Line(color={0,0,128}, smooth=Smooth.None));
  connect(feedback.p2, vOut.n) annotation(Line(color={0,0,128}, smooth=Smooth.None));
end Subtracter;