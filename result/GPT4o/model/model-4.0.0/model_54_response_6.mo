model Subtracter
 extends Modelica.Icons.Example;

  parameter Modelica.Units.SI.Voltage Vin = 5 "Amplitude of the input voltage";
  parameter Modelica.Units.SI.Frequency f = 10 "Frequency of the input voltage";

  Modelica.Electrical.Analog.Basic.Ground ground;
  Modelica.Electrical.Analog.Sources.SineVoltage vIn1(V=Vin, f=f);
  Modelica.Electrical.Analog.Sources.ConstantVoltage vIn2(V=Vin);
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut;
  Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.Feedback feedback(i=0);

equation
  // Dual-Source Integration
  connect(vIn1.p, feedback.p1);
  connect(vIn2.p, feedback.p1_2);

  // Reference & Return
  connect(vIn1.n, ground.p);
  connect(vIn2.n, ground.p);
  connect(feedback.n1, ground.p);

  // Output Differential
  connect(feedback.p2, vOut.n);
  connect(feedback.n2, vOut.p);

end Subtracter;