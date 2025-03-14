model Subtracter "Inverting subtracter"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Voltage Vin=5 "Amplitude of input voltage";
  parameter Modelica.Units.SI.Frequency f=10 "Frequency of input voltage";
  Modelica.Electrical.Analog.Basic.Ground ground;
  Modelica.Electrical.Analog.Sources.SineVoltage vIn1(V=Vin, f=f);
  Modelica.Electrical.Analog.Sources.ConstantVoltage vIn2(V=Vin);
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut;
  Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.Feedback feedback(p1_2(i(start=0)));
equation
  connect(feedback.n1, ground.p);
  connect(vIn1.p, feedback.p1);
  connect(vIn2.p, feedback.p1_2);
  connect(ground.p, vIn2.n);
  connect(ground.p, vIn1.n);
  connect(feedback.p2, vOut.n);
  connect(feedback.n2, vOut.p);
end Subtracter;
